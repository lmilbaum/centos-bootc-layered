# This image contains cloud-init, which makes it usable out of the box
# for e.g. a pre-generated AWS or KVM guest system.
FROM quay.io/centos-bootc/fedora-bootc:eln
RUN dnf -y install cloud-init && \
    ln -s ../cloud-init.target /usr/lib/systemd/system/default.target.wants && \
    rm /var/log/*.log /var/lib/dnf -rf && ostree container commit
