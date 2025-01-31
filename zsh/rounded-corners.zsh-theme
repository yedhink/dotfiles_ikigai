POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# Prompts
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator os_icon ssh context dir pyenv virtualenv vcs)
else
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable virtualenv vcs)
fi
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nodenv rbenv battery)


##########################[ prompt: fillers, tails, separators ]###########################
# PROMPT CUSOTMIZATIONS - SEPARATORS ETC
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
# Separator between same-color segments on the left.
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B6'
# The left end of left prompt.
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B6'
# The right end of left prompt.
POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B4'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
# Separator between same-color segments on the right.
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='|'
# The left end of right prompt.
POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B6'
# The right end of right prompt.
POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B4'
####################################################################################################


##########################[ status: exit code of the last command ]###########################
# OK STATUS - TRIED SETTING UNICODE \uf004, BUT DIDNT WORK!
POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION=''
POWERLEVEL9K_STATUS_ERROR=true
POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
# typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=3
# typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=1
# Status when the last command was terminated by a signal.
POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
# Use terse signal names: "INT" instead of "SIGINT(2)".
POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
# POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=3
# POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=1
# Status when some part of a pipe command fails and the overall exit status is also non-zero.
# It may look like this: 1|0.
POWERLEVEL9K_STATUS_ERROR_PIPE=true
POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
####################################################################################################


##################################[ dir: current directory ]##################################
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_ETC_ICON='%F{black}\uf423'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="black"
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_ICON='\uf015'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER="\uf141"
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=""
POWERLEVEL9K_DIR_CLASSES=(
    '/media/ikigai/work(/*)#'              WORK     '\uf0b1'
    '*/movies(/*)#'                        MOVIES   '\uf03d'
    '*/Arch*(/*)|*/bookmarks/ikigai(/*)#'  ARCH     ''
    '~(/*)#'                               HOME     '\uf015'
    '(/*)#'                                ROOT     '\uf0e7'
    '*'                                    DEFAULT  ''
	)
#POWERLEVEL9K_FOLDER_ICON=""
#POWERLEVEL9K_HOME_ICON="\uf015"
#POWERLEVEL9K_HOME_SUB_ICON="$(print_icon "HOME_ICON")"
#POWERLEVEL9K_DIR_PATH_ABSOLUTE=true
####################################################################################################


################################[ battery: internal battery ]#################################
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='30'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='028'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='blue'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='white'
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_STAGES=$'\uf244\uf243\uf242\uf241\uf240'
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='red'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='white'
#POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='white'
#POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='214'
####################################################################################################

#####################################[ vcs(GIT): git status ]######################################
POWERLEVEL9K_VCS_BACKENDS=(git)
# Enable counters for staged, unstaged, etc = -1.
POWERLEVEL9K_VCS_STAGED_MAX_NUM=-1
POWERLEVEL9K_VCS_UNSTAGED_MAX_NUM=-1
POWERLEVEL9K_VCS_UNTRACKED_MAX_NUM=-1
POWERLEVEL9K_VCS_CONFLICTED_MAX_NUM=-1
POWERLEVEL9K_VCS_COMMITS_AHEAD_MAX_NUM=-1
POWERLEVEL9K_VCS_COMMITS_BEHIND_MAX_NUM=-1
POWERLEVEL9K_VCS_UNTRACKED_ICON="\uf128" # not in git vc yet
POWERLEVEL9K_VCS_STAGED_ICON="\uf0fe" # added, but not commited
POWERLEVEL9K_VCS_COMMIT_ICON="" # commited and clean
POWERLEVEL9K_VCS_UNSTAGED_ICON="" # commited but modificd before push
POWERLEVEL9K_VCS_STASH_ICON="\uf187" # like a box
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\uf062" # ahead
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\uf063" # behind
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='cyan'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
####################################################################################################


# Add seperate colors for root + make it arrow like

# pipenv colors
# js integration
# git more specific with up and down refer bashed on a feeling

POWERLEVEL9K_INSTANT_PROMPT=verbose
# Colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_OS_ICON_BACKGROUND='white'
POWERLEVEL9K_OS_ICON_FOREGROUND='black'