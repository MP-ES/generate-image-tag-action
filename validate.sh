#! /bin/bash

if [ "$INPUT_REGISTRY" == "" ]; then
  echo "registry=hub.docker.com" >>"$GITHUB_ENV"
else
  echo "registry=$INPUT_REGISTRY" >>"$GITHUB_ENV"
fi

if [ "$INPUT_IMAGE" == "" ]; then
  echo "::error ::image is required"
  exit 1
fi
echo "image=$INPUT_IMAGE" >>"$GITHUB_ENV"
