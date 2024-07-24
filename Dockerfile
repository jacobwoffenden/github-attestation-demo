#checkov:skip=CKV_DOCKER_2: HEALTHCHECK not required

FROM docker.io/alpine@sha256:0a4eaa0eecf5f8c050e5bba433f58c052be7587ee8af3e8b3910ef9ab5fbe9f5

ENV CONTAINER_USER="nonroot" \
    CONTAINER_UID="10000" \
    CONTAINER_GROUP="nonroot" \
    CONTAINER_GID="10000" \
    CONTAINER_HOME="/app"

RUN <<EOF
addgroup \
  --gid "${CONTAINER_GID}" \
  --system \
  "${CONTAINER_GROUP}"

adduser \
  --uid "${CONTAINER_UID}" \
  --ingroup "${CONTAINER_GROUP}" \
  --disabled-password \
  "${CONTAINER_USER}"

install \
  --directory \
  --owner "${CONTAINER_USER}" \
  --group "${CONTAINER_GROUP}" \
  --mode 0755 \
  "${CONTAINER_HOME}"
EOF

USER ${CONTAINER_USER}

WORKDIR ${CONTAINER_HOME}
