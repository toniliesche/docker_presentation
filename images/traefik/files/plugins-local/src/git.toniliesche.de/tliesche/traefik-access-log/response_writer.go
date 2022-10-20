package traefik_access_log

import "net/http"

type ResponseWriter struct {
	http.ResponseWriter
	status int
	length int
}

func (r *ResponseWriter) WriteHeader(statusCode int) {
	r.status = statusCode
	r.ResponseWriter.WriteHeader(statusCode)
}

func (r *ResponseWriter) Write(body []byte) (n int, err error) {
	length, err := r.ResponseWriter.Write(body)
	r.length += length

	return length, err
}

func (r *ResponseWriter) Status() int {
	if r.status == 0 {
		return http.StatusOK
	}

	return r.status
}

func (r *ResponseWriter) Length() int {
	return r.length
}
