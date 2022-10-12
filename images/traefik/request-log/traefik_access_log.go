package traefik_access_log

import (
	"context"
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
	"time"
)

type Config struct {
	LogPath string
}

func CreateConfig() *Config {
	return &Config{
		LogPath: "/var/log/traefik-access.log",
	}
}

type RequestLog struct {
	next http.Handler
	name string
	log  *log.Logger
}

func New(ctx context.Context, next http.Handler, config *Config, name string) (http.Handler, error) {
	logFile, err := os.OpenFile(config.LogPath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		return nil, err
	}

	logger := log.New(logFile, "", 0)

	return &RequestLog{
		next: next,
		name: name,
		log:  logger,
	}, nil
}

func (l *RequestLog) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	start := time.Now()
	responder := &ResponseWriter{ResponseWriter: w}
	l.next.ServeHTTP(responder, r)

	host, _, err := net.SplitHostPort(r.RemoteAddr)
	if err != nil {
		host = r.RemoteAddr
	}

	userAgent := r.Header.Get("User-Agent")
	if userAgent == "" {
		userAgent = "-"
	}

	ssl := r.Header.Get("X-SSL")

	msg := fmt.Sprintf("[%s] %s %d %s %s%s \"%s\" %d",
		start.Format("2006/01/02 15:04:05"),
		host,
		responder.Status(),
		r.Method,
		r.Host,
		r.URL.RequestURI(),
		userAgent,
		responder.Length())

	if ssl == "1" {
		sslVersion := r.Header.Get("X-SSL-PROTOCOL")
		sslCipher := r.Header.Get("X-SSL-CIPHER")
		sslCert := r.Header.Get("X-SSL-CLIENT-HASCERT")
		var hasCert, clientDn, issuerDn string

		if sslCert == "1" {
			hasCert = "true"
			clientDn = r.Header.Get("X-SSL-CLIENT-DN")
			issuerDn = r.Header.Get("X-SSL-ISSUER-DN")
		} else {
			hasCert = "false"
			clientDn = "-"
			issuerDn = "-"
		}

		msg = fmt.Sprintf("%s %s/%s {%s,%s,%s}", msg, sslVersion, sslCipher, hasCert, clientDn, issuerDn)
	}

	l.log.Print(msg)
}
