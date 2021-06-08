# generate-image-tag-action

Workaround composite action to obtain an image tag in an expected format of [on-premises k8s-deploy](https://github.com/MP-ES/k8s-deploy) while <https://github.com/actions/runner/issues/646> is not ready.

[![License](https://img.shields.io/github/license/MP-ES/generate-image-tag-action.svg)](LICENSE)
[![Integration](https://github.com/MP-ES/generate-image-tag-action/workflows/Integration/badge.svg)](https://github.com/MP-ES/generate-image-tag-action/actions?query=workflow%3AIntegration)

## Usage

```yaml
- name: Generate image tag
  id: image_tag
  uses: MP-ES/generate-image-tag-action@v1
  with:
    # Server address of Docker registry. If not set then will default to Docker Hub
    registry: registry.domain.com

    # The name of docker image
    image: "service"
```

Then, you can do:

```yaml
- name: Build and Push
  uses: docker/build-push-action@v2
  with:
    tags: "${{ steps.image_tag.outputs.tag }}"
```

## Outputs

Following outputs are available:

| Name          | Type    | Description                           |
|---------------|---------|---------------------------------------|
| `tag`         | String  | Tag that must to be assigned to docker image          |
