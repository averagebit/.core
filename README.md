# Dotfiles and Scripts

Optionally export the environment variables to your liking and run the
setup script. The environment variables are used by `dot/git/setup` to
setup the `$HOME/.gitconfig` globals via `git config --global` and to
create the directories listed in the `setup` script.
```bash
$ export USER="$(whoami)" \
    GIT_USER="${USER}" \
    GIT_EMAIL="${USER}@pm.me" \
    GIT_GPG_KEY="${USER}" \
    GIT_DEFAULT_BRANCH=main \
    GIT_GPG_SIGN_COMMIT=true \
    GIT_GPG_SIGN_TAG=true \
    GIT_GPG_PROGRAM="$(which gpg)"

$ ./setup
```
