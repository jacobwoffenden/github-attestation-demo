#checkov:skip=CKV_DOCKER_2: HEALTHCHECK not required

FROM docker.io/alpine@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d

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
