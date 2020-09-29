#!/bin/bash

if [ -z "$PARACHAIN_BUILD_FOLDER" ]; then
    PARACHAIN_BUILD_FOLDER="build/alphanet"
fi

mkdir -p $PARACHAIN_BUILD_FOLDER

if [ -z "$PARACHAIN_BINARY" ]; then
    PARACHAIN_BINARY="target/release/moonbase-alphanet"
fi

if [ ! -f "$PARACHAIN_BINARY" ]; then
    echo "Parachain binary $PARACHAIN_BINARY is missing"
    echo "Please run: cargo build --release -p moonbase-alphanet"
fi

if [ -z "$PARACHAIN_SPEC_TEMPLATE" ]; then
    PARACHAIN_SPEC_TEMPLATE="specs/moonbase-alphanet-specs-template.json"
fi

if [ -z "$PARACHAIN_SPEC_PLAIN" ]; then
    PARACHAIN_SPEC_PLAIN="$PARACHAIN_BUILD_FOLDER/moonbase-alphanet-specs-plain.json"
fi

if [ -z "$PARACHAIN_SPEC_RAW" ]; then
    PARACHAIN_SPEC_RAW="$PARACHAIN_BUILD_FOLDER/moonbase-alphanet-specs-raw.json"
fi

if [ -z "$PARACHAIN_SPEC_TMP" ]; then
    PARACHAIN_SPEC_TMP="/tmp/moonbase-alphanet-specs-tpm.json"
fi

if [ -z "$PARACHAIN_WASM" ]; then
    PARACHAIN_WASM="$PARACHAIN_BUILD_FOLDER/moonbase-alphanet-runtime.wasm"
fi

if [ -z "$PARACHAIN_GENESIS" ]; then
    PARACHAIN_GENESIS="$PARACHAIN_BUILD_FOLDER/moonbase-alphanet-genesis.txt"
fi

if [ -z "$PARACHAIN_ID" ]; then
    PARACHAIN_ID=1000
fi

if [ -z "$POLKADOT_SPEC_TEMPLATE" ]; then
    POLKADOT_SPEC_TEMPLATE="specs/rococo-alphanet-specs-template.json"
fi

if [ -z "$POLKADOT_SPEC_PLAIN" ]; then
    POLKADOT_SPEC_PLAIN="$PARACHAIN_BUILD_FOLDER/rococo-alphanet-specs-plain.json"
fi

if [ -z "$POLKADOT_SPEC_RAW" ]; then
    POLKADOT_SPEC_RAW="$PARACHAIN_BUILD_FOLDER/rococo-alphanet-specs-raw.json"
fi

if [ -z "$POLKADOT_SPEC_TMP" ]; then
    POLKADOT_SPEC_TMP="/tmp/rococo-alphanet-specs-tpm.json"
fi


if [ -z "$USER_PORT" ]; then
    USER_PORT=30000
fi

if [ -z "$RELAY_IP" ]; then
    RELAY_IP="127.0.0.1"
fi

if [ -z "$PARACHAIN_IP" ]; then
    PARACHAIN_IP="127.0.0.1"
fi

RELAY_KEYS=(
    0000000000000000000000000000000000000000000000000000000000000000
    1111111111111111111111111111111111111111111111111111111111111111
    2222222222222222222222222222222222222222222222222222222222222222
    3333333333333333333333333333333333333333333333333333333333333333
    4444444444444444444444444444444444444444444444444444444444444444
    5555555555555555555555555555555555555555555555555555555555555555
    6666666666666666666666666666666666666666666666666666666666666666
    7777777777777777777777777777777777777777777777777777777777777777
    8888888888888888888888888888888888888888888888888888888888888888
    9999999999999999999999999999999999999999999999999999999999999999
)

RELAY_LOCAL_IDS=(
    12D3KooWDpJ7As7BWAwRMfu1VU2WCqNjvq387JEYKDBj4kx6nXTN
    12D3KooWPqT2nMDSiXUSx5D7fasaxhxKigVhcqfkKqrLghCq9jxz
    12D3KooWLdJAwPtyQ5RFnr9wGXsQzpf3P2SeqFbYkqbfVehLu4Ns
    12D3KooWBRFW3HkJCLKSWb4yG6iWRBpgNjbM4FFvNsL5T5JKTqrd
    12D3KooWQJzxKtEUvbt9BZ1uJyAMw2WSEQSShp4my4c3iikhW8Cf
    12D3KooWPBFzpNemfrwjMSTSENKAC6cDHxE2RXojcMJRwMtitDms
    12D3KooWDN7K2vo9rDBdpWGjDwMsQJaWvSqJxKZKg5ywyS42P8aq
    12D3KooWPJMiEvJ35ads69T4zVAVvihYwqvsA3HwPG47xhFPpUXQ
    12D3KooWMpKQKCjbZf2ZRy8RBr8P9H3ewjRb31LKe5abY71WfjKZ
    12D3KooWDGAJVHbtPZfhUtDMJ9FBUJopLrEKT5SusQ5dgcr39ypY
)

PARACHAIN_KEYS=(
    0000000000000000000000000000100000000000000000000000000000000000
    0000000000000000000000000000111111111111111111111111111111111111
    0000000000000000000000000000122222222222222222222222222222222222
    0000000000000000000000000000133333333333333333333333333333333333
    0000000000000000000000000000144444444444444444444444444444444444
    0000000000000000000000000000155555555555555555555555555555555555
    0000000000000000000000000000166666666666666666666666666666666666
    0000000000000000000000000000177777777777777777777777777777777777
    0000000000000000000000000000188888888888888888888888888888888888
    0000000000000000000000000000199999999999999999999999999999999999
)

PARACHAIN_LOCAL_IDS=(
    12D3KooWJ8BACzWs2x7yt1UozRrZrtcgUhpJrBbYrYqAQBa1ZXFN
    12D3KooWAZsNtba8pPJMYdbUUr9KFLQbFioPZKbpdNnbouSk6tto
    12D3KooWK5yfHLPADzZEKKzyqHjf3y5bi6jP6egNZL7aYp4us52E
    12D3KooWHtc11BNuNo9CbHb7MQS7NDue1qRjgnHbyyY8bo3Fu2L3
    12D3KooWDoaPdMd86ZPRTR9tmdw1qcdkdzLLWAXZSg5r4qWcyvZF
    12D3KooWHXyX7DHVr8nRHfbu7ct6Zyy4NEhciAzG6XqHRFC3zHEs
    12D3KooWAUHzje7vqkwBUTkiK8LMrMi52qgfyb8ouVpefo3tSXnk
    12D3KooWRjUyXkjqbmZ5XUiwrSz4fPrP3Q4wkhq7b2FZD8cRmDkm
    12D3KooWJ2sbvqxSA8D3VYa33XhhkmuZt58nxdWMKo2z3Mf3mafa
    12D3KooWNdXzpEDHHt6gnWx6RXc8J8YFZMhjQ154GDGHQBDNZZ9V
)