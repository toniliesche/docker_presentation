package traefik_x_requestid

import (
	"context"
	"fmt"
	uuid "github.com/satori/go.uuid"
	"net/http"
)

type Config struct {
	HeaderKey    string
	HeaderPrefix string
}

func CreateConfig() *Config {
	return &Config{
		HeaderKey:    "X-REFERRAL-ID",
		HeaderPrefix: "phpughh",
	}
}

type TraefikXRequestIDMiddleware struct {
	next         http.Handler
	name         string
	headerKey    string
	headerPrefix string
}

func New(ctx context.Context, next http.Handler, config *Config, name string) (http.Handler, error) {
	return &TraefikXRequestIDMiddleware{
		next:         next,
		name:         name,
		headerKey:    config.HeaderKey,
		headerPrefix: config.HeaderPrefix,
	}, nil
}

func (h *TraefikXRequestIDMiddleware) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if r.Header.Get(h.headerKey) == "" {
		r.Header.Add(h.headerKey, fmt.Sprintf("%s-%s", h.headerPrefix, uuid.NewV1().String()))
	}

	h.next.ServeHTTP(w, r)
}
