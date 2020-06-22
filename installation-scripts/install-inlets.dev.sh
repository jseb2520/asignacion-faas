#!/usr/bin/env bash

# Install inletsctl
curl -sLSf https://inletsctl.inlets.dev | sudo sh

# Install inlets
sudo inletsctl download

inlets client --remote "ws://34.82.3.78:8080" --token "Kd6qf8yeeggw6Bfdz2T7A33MC0GYG1CqayLtaJAlpTgridDcrVdizriR5OTNSHvV" --upstream "http://127.0.0.1:8000"