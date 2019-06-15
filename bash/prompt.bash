# Colors
PROMPT_COLOR_RED="$(tput setaf 1)"
PROMPT_COLOR_GREEN="$(tput setaf 2)"
PROMPT_COLOR_YELLOW="$(tput setaf 3)"
PROMPT_COLOR_BLUE="$(tput setaf 4)"
PROMPT_COLOR_MAGENTA="$(tput setaf 5)"
PROMPT_COLOR_CYAN="$(tput setaf 6)"
PROMPT_COLOR_WHITE="$(tput setaf 7)"
PROMPT_COLOR_GRAY="$(tput setaf 8)"
PROMPT_BOLD="$(tput bold)"
PROMPT_UNDERLINE="$(tput sgr 0 1)"
PROMPT_INVERT="$(tput sgr 1 0)"
PROMPT_RESET="$(tput sgr0)"

# User color
case $(id -u) in
	0) USER_COLOR="$PROMPT_COLOR_RED" ;;  # root
	*) USER_COLOR="$PROMPT_COLOR_GREEN" ;;
esac

# Toggle
if [[ -z $PROMPT_SHOW_USER ]]; then
  PROMPT_SHOW_USER=0
fi
if [[ -z $PROMOT_GIT_SHOW_DIRTY ]]; then
  PROMOT_GIT_SHOW_DIRTY=1
fi
if [[ -z $PROMOT_GIT_SHOW_UPSTREAM ]]; then
  PROMOT_GIT_SHOW_UPSTREAM=1
fi
if [[ -z $PROMOT_GIT_SHOW_STASH ]]; then
  PROMOT_GIT_SHOW_STASH=1
fi

# Symbols
if [[ -z $PROMPT_SYMBOL ]]; then
  PROMPT_SYMBOL="$"
fi
if [[ -z $PROMPT_GIT_DIRTY_SYMBOL ]]; then
  PROMPT_GIT_DIRTY_SYMBOL="*"
fi
if [[ -z $PROMPT_GIT_CLEAN_SYMBOL ]]; then
  PROMPT_GIT_CLEAN_SYMBOL=""
fi
if [[ -z $PROMOT_GIT_STASH_SYMBOL ]]; then
  PROMOT_GIT_STASH_SYMBOL="⚑"
fi
if [[ -z $PROMPT_GIT_AHEAD_SYMBOL ]]; then
	PROMPT_GIT_AHEAD_SYMBOL="⇡"
fi
if [[ -z $PROMPT_GIT_BEHIND_SYMBOL ]]; then
	PROMPT_GIT_BEHIND_SYMBOL="⇣"
fi
if [[ -z $PROMOT_GIT_DIVERGED_SYMBOL ]]; then
  PROMOT_GIT_DIVERGED_SYMBOL="↕"
fi

function prompt_git_branch() {
  branch="$(git symbolic-ref --quiet --short HEAD 2> /dev/null)"
  if [[ -n "$branch" ]]; then
    echo "$branch"
  else
    echo "(unknown)"
  fi
}

function prompt_git_commits_ahead() {
  commits="$(git rev-list --count @{upstream}..HEAD)"
  if [[ "$commits" != 0 ]]; then
    echo "$commits"
  fi
}

function prompt_git_commits_behind() {
  commits="$(git rev-list --count HEAD..@{upstream})"
  if [[ "$commits" != 0 ]]; then
    echo "$commits"
  fi
}

function prompt_git_branch_ahead() {
  if [[ -n "$(git rev-list origin/$(prompt_git_branch)..HEAD 2> /dev/null)" ]]; then
    echo "$PROMPT_GIT_AHEAD_SYMBOL"
  fi
}

function prompt_git_branch_behind() {
  if [[ -n "$(git rev-list HEAD..origin/$(prompt_git_branch) 2> /dev/null)" ]]; then
    echo "$PROMPT_GIT_BEHIND_SYMBOL"
  fi
}

function prompt_git_short_sha() {
  echo "$(git rev-parse --short HEAD 2> /dev/null)"
}

function prompt_git_long_sha() {
  echo "$(command git rev-parse HEAD 2> /dev/null)"
}

function prompt_git_user_name() {
  echo "$(git config user.name 2> /dev/null)"
}

function prompt_git_user_email() {
  echo "$(git config user.email 2> /dev/null)"
}

function prompt_git_progress() {
  git_dir="$(git rev-parse --git-dir)"

  if [[ -f "$git_dir/MERGE_HEAD" ]]; then
    echo " [merge]"
  elif [[ -d "$git_dir/rebase-apply" ]]; then
    if [[ -f "$git_dir/rebase-apply/applying" ]]; then
      echo " [am]"
    else
      echo " [rebase]"
    fi
  elif [[ -d "$git_dir/rebase-merge" ]]; then
    echo " [rebase]"
  elif [[ -f "$git_dir/CHERRY_PICK_HEAD" ]]; then
    echo " [cherry-pick]"
  fi
  if [[ -f "$git_dir/BISECT_LOG" ]]; then
    echo " [bisect]"
  fi
  if [[ -f "$git_dir/REVERT_HEAD" ]]; then
    echo " [revert]"
  fi
}

function prompt_git_dirty() {
  (git diff --quiet --ignore-submodules && echo "$PROMPT_GIT_CLEAN_SYMBOL") || echo "$PROMPT_GIT_DIRTY_SYMBOL"
}

function prompt_git_stashed() {
  if [[ -n $(git rev-parse --verify --quiet refs/stash 2> /dev/null) ]]; then
    echo "$PROMOT_GIT_STASH_SYMBOL"
  fi
}

function prompt_git_refresh() {
  git update-index --really-refresh -q &> /dev/null;
}

function prompt_inside_git_repo() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) =~ true ]]; then
    echo 1
  fi
}

function prompt_git_compare_upstream() {
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$INDEX" | grep "^## [^ ]\+ .*ahead" &> /dev/null); then
    echo "$PROMPT_GIT_AHEAD_SYMBOL"
  fi
  if $(echo "$INDEX" | grep "^## [^ ]\+ .*behind" &> /dev/null); then
    echo "$PROMPT_GIT_BEHIND_SYMBOL"
  fi
  if $(echo "$INDEX" | grep "^## [^ ]\+ .*diverged" &> /dev/null); then
    echo "$PROMPT_GIT_DIVERGED_SYMBOL"
  fi
  # left=$(git rev-list --left-only --count HEAD...@{upstream} 2> /dev/null)
  # right=$(git rev-list --right-right --count HEAD...@{upstream} 2> /dev/null)
}

# Only show when Git is istalled and in git directory
function prompt_git() {
  if [[ -n $(command -v git 2> /dev/null) && $(git rev-parse --is-inside-work-tree 2> /dev/null) =~ true ]]; then
    prompt_git_refresh

    local dirty
    if [[ $PROMOT_GIT_SHOW_DIRTY != 0 ]]; then
      dirty=$(prompt_git_dirty)
    fi

    local stash
    if [[ $PROMOT_GIT_SHOW_STASH != 0 ]]; then
      stash=$(prompt_git_stashed)
    fi

    local upstream
    if [[ $PROMOT_GIT_SHOW_UPSTREAM != 0 ]]; then
      upstream=$(prompt_git_compare_upstream)
    fi

    echo "$PROMPT_COLOR_GRAY $(prompt_git_branch) $dirty $PROMPT_COLOR_CYAN$upstream$PROMPT_COLOR_YELLOW$stash$PROMPT_RESET"
  fi
}

function prompt_command() {
	# Local or SSH session?
	local remote=
	[ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && remote=1

	# Only show username if not default
	local user_prompt
	[ $PROMPT_SHOW_USER != 0 ] && [ "$USER" != "$local_username" ] && user_prompt="$USER_COLOR$USER$PROMPT_RESET"

	# Show hostname inside SSH session
	local host_prompt
	[ -n "$remote" ] && host_prompt="@$PROMPT_COLOR_YELLOW$HOSTNAME$PROMPT_RESET"

	# Show delimiter if user or host visible
	local login_delimiter
	[ -n "$user_prompt" ] || [ -n "$host_prompt" ] && login_delimiter=":"

	# Format prompt
	first_line="$user_prompt$host_prompt$login_delimiter$PROMPT_COLOR_BLUE\w$PROMPT_RESET$(prompt_git)"
	# Text (commands) inside \[...\] does not impact line length calculation which fixes stange bug when looking through the history
	# $? is a status of last command, should be processed every time prompt prints
	second_line="\`if [ \$? = 0 ]; then echo \[\$PROMPT_COLOR_MAGENTA\]; else echo \[\$PROMPT_COLOR_RED\]; fi\`\$PROMPT_SYMBOL\[\$PROMPT_RESET\] "
	PS1="\n$first_line\n$second_line"

	# Multiline command
	PS2="\[$PROMPT_COLOR_MAGENTA\]$PROMPT_SYMBOL\[$PROMPT_RESET\] "

	# Terminal title
	local title="$(basename "$PWD")"
	[ -n "$remote" ] && title="$title \xE2\x80\x94 $HOSTNAME"
	echo -ne "\033]0;$title"; echo -ne "\007"
}

PROMPT_COMMAND=prompt_command
