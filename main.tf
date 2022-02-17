locals {
  cluster_name = "${terraform.workspace}-${var.cluster_name}"
}
#begin by deploying the cluster
module "gke" {
  source = "./gke-module/"
  cluster_name = local.cluster_name
}

#get cluster authorization to send kubectl orders
module "gke_auth" {
  depends_on           = [module.gke]
  source               = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  project_id           = "w38-eguillen"
  cluster_name         = local.cluster_name
  location             = "europe-west1"
  use_private_endpoint = false
}


# define where everything is located.
data "kubectl_file_documents" "namespace" {
  content = file("./argostuff/arcd-namespace.yaml")
}

data "kubectl_file_documents" "argocd" {
  content = file("./argostuff/argocd.yaml")
}

data "kubectl_file_documents" "argoapp" {
  content = file("./argostuff/argoapp.yaml")
}


#begin deploying kubectl manifests with the argo namespace, install file, and app file.
resource "kubectl_manifest" "namespace" {
  count              = length(data.kubectl_file_documents.namespace.documents)
  yaml_body          = element(data.kubectl_file_documents.namespace.documents, count.index)
  override_namespace = "argocd"
}

resource "kubectl_manifest" "argocd" {
  depends_on = [
    kubectl_manifest.namespace,
  ]
  count              = length(data.kubectl_file_documents.argocd.documents)
  yaml_body          = element(data.kubectl_file_documents.argocd.documents, count.index)
  override_namespace = "argocd"
}

resource "kubectl_manifest" "argoapp" {
  depends_on = [
    kubectl_manifest.argocd,
  ]
  count              = length(data.kubectl_file_documents.argocd.documents)
  yaml_body          = element(data.kubectl_file_documents.argoapp.documents, count.index)
  override_namespace = "argocd"
}