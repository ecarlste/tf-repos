resource "github_repository" "gh-repo" {
  name          = var.repo_name
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

resource "github_repository_ruleset" "gh-repo-ruleset" {
  repository  = github_repository.gh-repo.name
  name        = "${github_repository.gh-repo.name}: Code Owner Approval"
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      exclude = []
      include = [
        "~DEFAULT_BRANCH",
      ]
    }
  }

  bypass_actors {
    actor_id    = 5
    actor_type  = "RepositoryRole"
    bypass_mode = "pull_request"
  }

  rules {
    deletion         = true
    non_fast_forward = true

    pull_request {
      dismiss_stale_reviews_on_push     = false
      require_code_owner_review         = true
      require_last_push_approval        = true
      required_approving_review_count   = 1
      required_review_thread_resolution = true
    }
  }
}
