# Git / Github

## :bulb: Tips

### clone repository with specific key

`ssh-agent bash -c 'ssh-add ~/.ssh/id_rsa_specific; git clone git@github.com:orga/repo.git ./'`

### Squash several Git commits into a single commit
> source: https://makandracards.com/makandra/527-squash-several-git-commits-into-a-single-commit

#### Easy mode: Reset your feature branch to the master state

```bash
# Switch to the master branch and make sure you are up to date.
git checkout master
git fetch # this may be necessary (depending on your git config) to receive updates on origin/master
git pull

# Merge the feature branch into the master branch.
git merge feature_branch

# Reset the master branch to origin's state.
git reset origin/master

# Git now considers all changes as unstaged changes.
# We can add these changes as one commit.
# Adding . will also add untracked files.
git add --all
git commit
```

