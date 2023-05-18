# Get current branch name, if remote origin exists
git_reponame() {
        REPO=$(git remote get-url origin 2>/dev/null)
        [ "$?" = "0" ] && { [ "${REPO: -4}" = ".git" ] && NAME=${REPO: : -4} || NAME=$REPO; echo -n ' '$(basename $NAME); }
}

# Get current branch name
git_branch() {
        GIT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null)
        [ -n "$GIT_BRANCH" ] && echo -n ' '$GIT_BRANCH
}

# For default prompt like user@host:~$ transform into user@host:~ repo [branch]$
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1=${PS1: 0:-3}'\[\e[01;31m\]$(git_reponame)\[\e[0m\]\[\e[0;36m\]$(git_branch)\[\e[0m\]$ '
PS1="\n\[\033[38;5;103m\]┌─("
PS1=${PS1}"\[\033[38;5;75m\]\u@debian\[\033[38;5;103m\])─[\[\033[0m\]\w\[\033[38;5;103m\]]"
PS1=${PS1}'\[\033[38;5;241m\]\[\033[38;5;36m\]$(git_reponame)\[\033[38;5;203m\]$(git_branch)\[\033[38;5;103m\]'
PS1=${PS1}"\n└─ \[\033[38;5;75m\]$ \[\033[0m\]"

clear
