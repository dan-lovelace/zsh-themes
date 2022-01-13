function random_success() {
	# available: 😃 🤪 😎 🤘
	active=(😃 🤪 😎)
	size=${#active[*]}
	index=$(($RANDOM % $size + 1))
	echo $active[$index]
}

function random_error() {
	# available: 💀 💩 🤬 👹
	active=(💀 💩 🤬)
        size=${#active[*]}
        index=$(($RANDOM % $size + 1))
        echo $active[$index]
}

COLOR_SCHEME="fish"

case "$COLOR_SCHEME" in
	slate)
		local bar_color="$FG[235]"
		local dir_color="$FG[252]"
		local git_color="$FG[066]"
		local now_color="$FG[255]"
		;;
	fish)
		local bar_color="$FG[105]"
		local dir_color="$FG[174]"
		local git_color="$FG[222]"
		local now_color="$FG[007]"
		;;
	*)
		local bar_color="$FG[009]"
		local dir_color="$FG[033]"
		local git_color="$FG[011]"
		local now_color="$FG[229]"
		;;
esac

local blue_op="%{$bar_color%}[%{$reset_color%}"
local blue_cp="%{$bar_color%}]%{$reset_color%}"
local now="${blue_op}%{$now_color%}%D{%L:%M:%S}${blue_cp}"
local top_br="%{$bar_color%}╭─%{$reset_color%}"
local bot_br="%{$bar_color%}╰─%{$reset_color%}"
local working_dir="%~/"
local cur_dir="%{$blue_op%}%B%{$dir_color%}${working_dir}%b%{$blue_cp%}"

NEWLINE=$'\n'

PROMPT='${NEWLINE}${top_br}%{$bar_color%}$(printf "%0.s─" $(seq 1 $((${#${(%)working_dir}}+2))))─╮
│ ${cur_dir}%{$bar_color%}─╯ %{$(git_prompt_info)%}
${bot_br}${now} ${RANDOM##*}%(?,$(random_success),$(random_error)) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$git_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
