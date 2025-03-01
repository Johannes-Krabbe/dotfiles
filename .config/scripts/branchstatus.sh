if [ -z "$1" ]; then
    echo "Usage: git branch-status <branch_name>"
    exit 1
fi

target_branch=$1
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Check if target branch exists
if ! git show-ref --verify --quiet "refs/heads/$target_branch"; then
    echo "Error: Branch '$target_branch' does not exist"
    exit 1
fi

# Get the common ancestor of both branches
base=$(git merge-base $current_branch $target_branch)

# Count commits ahead and behind
ahead=$(git rev-list $current_branch..$target_branch --count)
behind=$(git rev-list $target_branch..$current_branch --count)

echo "'$current_branch' is $behind commits ahead of, $ahead commits behind '$target_branch'"
