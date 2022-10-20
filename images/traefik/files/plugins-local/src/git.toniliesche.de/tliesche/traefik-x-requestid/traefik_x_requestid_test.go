package traefik_x_requestid_test

import (
	"context"
	traefik_x_requestid "git.toniliesche.de/tliesche/traefik-x-requestid"
	"net/http"
	"net/http/httptest"
	"regexp"
	"testing"
)

func TestXHeadersDefault(t *testing.T) {
	cfg := traefik_x_requestid.CreateConfig()

	ctx := context.Background()
	next := http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {})

	handler, err := traefik_x_requestid.New(ctx, next, cfg, "traefik-x-requestid-middleware")
	if err != nil {
		t.Fatal(err)
	}

	recorder := httptest.NewRecorder()

	r, err := http.NewRequestWithContext(ctx, http.MethodGet, "http://traefik.phpug.hh", nil)
	if err != nil {
		t.Fatal(err)
	}

	handler.ServeHTTP(recorder, r)

	header := r.Header.Get("X-REFERRAL-ID")
	if header == "" {
		t.Errorf("header %s has not been set", "X-REFERRAL-ID")
	}

	match, _ := regexp.MatchString("^phpughh-[\\da-f]{8}-[\\dda-f]{4}-[\\dda-f]{4}-[\\dda-f]{4}-[\\dda-f]{12}$", header)
	if !match {
		t.Errorf("header %s's format does not match expected value: %s", "X-REFERRAL-ID", header)
	}
}

func TestXHeadersCustomFormat(t *testing.T) {
	cfg := traefik_x_requestid.CreateConfig()
	cfg.HeaderPrefix = "traefik"

	ctx := context.Background()
	next := http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {})

	handler, err := traefik_x_requestid.New(ctx, next, cfg, "traefik-x-requestid-middleware")
	if err != nil {
		t.Fatal(err)
	}

	recorder := httptest.NewRecorder()

	r, err := http.NewRequestWithContext(ctx, http.MethodGet, "http://traefik.phpug.hh", nil)
	if err != nil {
		t.Fatal(err)
	}

	handler.ServeHTTP(recorder, r)

	header := r.Header.Get("X-REFERRAL-ID")
	if header == "" {
		t.Errorf("header %s has not been set", "X-REFERRAL-ID")
	}

	match, _ := regexp.MatchString("^traefik-[\\da-f]{8}-[\\dda-f]{4}-[\\dda-f]{4}-[\\dda-f]{4}-[\\dda-f]{12}$", header)
	if !match {
		t.Errorf("header %s's format does not match expected value", "X-REFERRAL-ID")
	}
}

func TestXHeadersCustomKey(t *testing.T) {
	cfg := traefik_x_requestid.CreateConfig()
	cfg.HeaderKey = "X-TRAEFIK-REFERRAL-ID"

	ctx := context.Background()
	next := http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {})

	handler, err := traefik_x_requestid.New(ctx, next, cfg, "traefik-x-requestid-middleware")
	if err != nil {
		t.Fatal(err)
	}

	recorder := httptest.NewRecorder()

	r, err := http.NewRequestWithContext(ctx, http.MethodGet, "http://traefik.phpug.hh", nil)
	if err != nil {
		t.Fatal(err)
	}

	handler.ServeHTTP(recorder, r)

	header := r.Header.Get("X-REFERRAL-ID")
	if header != "" {
		t.Errorf("header %s should not have been set", "X-REFERRAL-ID")
	}

	header = r.Header.Get("X-TRAEFIK-REFERRAL-ID")
	if header == "" {
		t.Errorf("header %s has not been set", "X-TRAEFIK-REFERRAL-ID")
	}
	match, _ := regexp.MatchString("^phpughh-[\\da-f]{8}-[\\dda-f]{4}-[\\dda-f]{4}-[\\dda-f]{4}-[\\dda-f]{12}$", header)
	if !match {
		t.Errorf("header %s's format does not match expected value: %s", "X-TRAEFIK-REFERRAL-ID", header)
	}
}

func TestXHeadersKeepExisting(t *testing.T) {
	cfg := traefik_x_requestid.CreateConfig()

	ctx := context.Background()
	next := http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {})

	handler, err := traefik_x_requestid.New(ctx, next, cfg, "traefik-x-requestid-middleware")
	if err != nil {
		t.Fatal(err)
	}

	recorder := httptest.NewRecorder()

	r, err := http.NewRequestWithContext(ctx, http.MethodGet, "http://traefik.phpug.hh", nil)
	if err != nil {
		t.Fatal(err)
	}

	oldHeader := "phpughh-01234567-8901-2345-6789-012345678901"

	r.Header.Add("X-REFERRAL-ID", oldHeader)

	handler.ServeHTTP(recorder, r)

	header := r.Header.Get("X-REFERRAL-ID")
	if header == "" {
		t.Errorf("header %s has not been set", "X-REFERRAL-ID")
	}

	match, _ := regexp.MatchString("^phpughh-[\\da-f]{8}-[\\dda-f]{4}-[\\dda-f]{4}-[\\dda-f]{4}-[\\dda-f]{12}$", header)
	if !match {
		t.Errorf("header %s's format does not match expected value: %s", "X-REFERRAL-ID", header)
	}

	if header != oldHeader {
		t.Errorf("header %s has been overridden while it shouldn't", "X-REFERRAL-ID")
	}
}
