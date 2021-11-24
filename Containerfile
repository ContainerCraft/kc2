FROM ghcr.io/bkahlert/libguestfs:latest as sysprep

# Download Image
ARG FLAVOR=${FLAVOR}
ARG DOWNLOAD_URL=${DOWNLOAD_URL}

COPY preview/${FLAVOR}/virt.sysprep /disk/virt.sysprep
WORKDIR /disk

RUN set -ex \
    && curl --output source.${FLAVOR}.qcow2 -L "${DOWNLOAD_URL}"                  \
    && qemu-img resize source.${FLAVOR}.qcow2 +32G                                \
    && virt-sparsify --compress source.${FLAVOR}.qcow2 ${FLAVOR}.qcow2            \
    && rm source.${FLAVOR}.qcow2                                                  \
    && echo;

# Sysprep Image
RUN set -ex \
    && virt-sysprep -va ${FLAVOR}.qcow2                                           \
         --network --commands-from-file virt.sysprep                              \
         --enable user-account,logfiles,customize,bash-history,net-hostname,net-hwaddr,machine-id,dhcp-server-state,dhcp-client-state,yum-uuid,udev-persistent-net,tmp-files,smolt-uuid,rpm-db,package-manager-cache \
    && virt-sparsify --compress ${FLAVOR}.qcow2 ${FLAVOR}.sparse.qcow2            \
    && rm ${FLAVOR}.qcow2                                                         \
    && qemu-img info ${FLAVOR}.sparse.qcow2                                       \
    && echo;

# Copy disk image into cradle
FROM scratch
ARG FLAVOR=${FLAVOR}
COPY --from=sysprep /disk/${FLAVOR}.sparse.qcow2 /disk/${FLAVOR}.qcow2
