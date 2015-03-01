#!/usr/bin/env bash

appledoc --project-company GOKU --company-id com.goku-commerce --project-name \
GKUserKit --output ./Document -h GKUserKit GKUserKitExampleTests

appledoc --project-company GOKU --company-id com.goku-commerce --project-name \
GKUserKit --output ./Document -h --no-create-docset \
GKUserKit GKUserKitExampleTests