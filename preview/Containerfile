FROM ghcr.io/bkahlert/libguestfs:latest as sysprep

ARG TARGETARCH
ARG FLAVOR=${FLAVOR}
ARG VERSION=${VERSION}

WORKDIR /disk

COPY preview/index.json /disk/index.json
# Download Image
RUN set -ex \
    # TODO: replace this nasty grep with jq \
    && curl --output source.${FLAVOR}.qcow2 -L $(grep -Po '"'${FLAVOR}-${VERSION}-${TARGETARCH}'": *\K"[^"]*"' index.json | tr -d '"') \
    && qemu-img resize source.${FLAVOR}.qcow2 +20G                                \
    && virt-sparsify -v --compress source.${FLAVOR}.qcow2 ${FLAVOR}.qcow2         \
    && rm source.${FLAVOR}.qcow2                                                  \
    && echo;

COPY preview/${FLAVOR}/virt.sysprep /disk/virt.sysprep
# Sysprep Image
RUN set -ex \
    && virt-sysprep -va ${FLAVOR}.qcow2                                           \
         --network                                                                \
         --commands-from-file virt.sysprep                                        \
         --enable user-account,logfiles,customize,bash-history,net-hostname,net-hwaddr,machine-id,dhcp-server-state,dhcp-client-state,yum-uuid,udev-persistent-net,tmp-files,smolt-uuid,rpm-db,package-manager-cache \
    && virt-sparsify --compress ${FLAVOR}.qcow2 ${FLAVOR}.sparse.qcow2            \
    && rm ${FLAVOR}.qcow2                                                         \
    && qemu-img info ${FLAVOR}.sparse.qcow2                                       \
    && echo;

# Copy disk image into cradle
FROM scratch
ARG FLAVOR=${FLAVOR}
COPY --from=sysprep /disk/${FLAVOR}.sparse.qcow2 /disk/${FLAVOR}.qcow2
