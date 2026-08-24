# Deploy the built Hugo site to the gh-pages branch (local analog of
# pkgdown::deploy_to_branch()).
#
# If GitHub Actions also updated gh-pages, pull first:
#   git -C public pull --rebase origin gh-pages
# then run: source("deploy.R")

stopifnot(file.exists("index.Rmd") || dir.exists("content"))

public_git <- file.path("public", ".git")
if (!file.exists(public_git)) {
  stop(
    "`public/` is not a git worktree. From the source repo run:\n",
    "  git fetch origin\n",
    "  git worktree add -B gh-pages public origin/gh-pages"
  )
}

branch <- system2(
  "git",
  c("-C", "public", "rev-parse", "--abbrev-ref", "HEAD"),
  stdout = TRUE
)
if (!identical(branch, "gh-pages")) {
  stop("`public/` must be on the gh-pages branch, currently: ", branch)
}

blogdown::build_site()

nojekyll <- file.path("public", ".nojekyll")
if (!file.exists(nojekyll)) {
  file.create(nojekyll)
}

status <- system2("git", c("-C", "public", "status", "--porcelain"), stdout = TRUE)
if (length(status) == 0) {
  message("No changes to deploy.")
} else {
  system2("git", c("-C", "public", "add", "-A"), stdout = TRUE)
  msg <- paste("Deploy site", format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
  system2("git", c("-C", "public", "commit", "-m", msg), stdout = TRUE)
  system2("git", c("-C", "public", "push", "origin", "gh-pages"), stdout = TRUE)
  message("Pushed public/ to origin/gh-pages.")
}
