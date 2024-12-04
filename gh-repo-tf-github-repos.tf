module "tf_repos_github_repository" {
  source    = "./modules/gh-repo"
  repo_name = "tf-repos"
}

module "local_vagrant_cluster_github_repository" {
  source    = "./modules/gh-repo"
  repo_name = "local-vagrant-cluster"
}
