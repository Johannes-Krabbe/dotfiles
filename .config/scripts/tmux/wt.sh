#!/bin/zsh
# wt.sh: create/find a git worktree for <branch> and open it in a fresh tmux session.
#
# Usage: wt <branch-name>
#
# Worktrees live at ~/Developer/worktrees/<repo-folder-name>/<branch-name>.
# If the branch exists locally or on origin, it's checked out; otherwise a new
# branch is created off origin/staging.
#
# Always recreates the tmux session for the worktree (kill + new), so each
# invocation drops you into a clean layout.

set -euo pipefail

if [[ $# -ne 1 ]]; then
  print -u2 "usage: wt <branch-name>"
  exit 1
fi

branch="$1"

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  print -u2 "error: not inside a git repository"
  exit 1
fi

repo_root="$(git rev-parse --show-toplevel)"
repo_name="${repo_root:t}"

base_dir="${HOME}/Developer/worktrees/${repo_name}"
worktree_path="${base_dir}/${branch}"

mkdir -p "$base_dir"

if [[ ! -d "$worktree_path" ]]; then
  print "fetching from origin..."
  git fetch origin --prune

  if git show-ref --verify --quiet "refs/heads/${branch}"; then
    print "branch '${branch}' exists locally — checking out into worktree"
    git worktree add "$worktree_path" "$branch"
  elif git show-ref --verify --quiet "refs/remotes/origin/${branch}"; then
    print "branch '${branch}' exists on origin — checking out tracking branch into worktree"
    git worktree add --track -b "$branch" "$worktree_path" "origin/${branch}"
  else
    print "branch '${branch}' does not exist — creating from origin/staging"
    git worktree add -b "$branch" "$worktree_path" "origin/staging"
  fi
fi

# tmux session names can't contain ':' or '.'; slashes work but look ugly.
session="${repo_name}-${branch//\//-}"

tmux kill-session -t "$session" 2>/dev/null || true

tmux new-session -d -s "$session" -c "$worktree_path"
tmux rename-window -t "$session:0" 'nvim'
tmux new-window -t "$session:1" -c "$worktree_path"
tmux send-keys -t "$session:0" 'clear' C-m
tmux send-keys -t "$session:1" 'bs staging' C-m

if [[ -n "${TMUX:-}" ]]; then
  tmux switch-client -t "$session:0"
else
  tmux attach-session -t "$session:0"
fi
