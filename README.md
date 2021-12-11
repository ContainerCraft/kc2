# Kubevirt Compute Library
Tenant Instance Reference Library

### Status
This repo represents pre-mvp alpha testing material.

### About
Kubevirt enables declarative infrastructure via kubernetes API CRDs. Together with
Multus, Container Data Importer (CDI) and a Kubernetes Storage Provider hypervisor
functions can be orchestrated and maintained with common k8s workflows including GitOps
tools and engines such as Cluster API, Kustomize, Helm, FluxCD and ArgoCD.

### KC2 Repository Purpose & Scope
This KC2 repo serves as a nucleus of kubernetes based virtual infrastructure definitions
and practices. 

Included you can find:
  - [ ] Instance Flavor Definitions (cpu/memory sizing)
  - [ ] Linux / BSD / Windows / Etc Deployments
  - [ ] Cloud-init cloud-config userdata renderers and templates
  - [ ] Host Networking Configuration
  - [ ] Single Node Tenant Kubernetes
    - [ ] k3s
    - [ ] microk8s
    - [ ] microshift
    - [ ] kubespray
  - [ ] docker + docker-compose tenant
  - [ ] VFW Virtual Firewall / Gateway(s)