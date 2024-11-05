resource "github_repository" "tf-github-repos" {
  name          = "tf-github-repos"
  has_downloads = true
  has_issues    = true
  has_projects  = true
  has_wiki      = true
}
