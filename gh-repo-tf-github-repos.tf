resource "github_repository" "tf-github-repos" {
  name          = "tf-github-repos"
  has_downloads = true
  has_issues    = true
  has_projects  = true
  has_wiki      = true

  allow_merge_commit          = false
  allow_squash_merge          = true
  allow_rebase_merge          = false
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  delete_branch_on_merge      = true
}
