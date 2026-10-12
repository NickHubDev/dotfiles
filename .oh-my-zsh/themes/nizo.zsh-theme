setopt PROMPT_SUBST

get_git_branch () {
    local branch
    branch=$(git status --branch --porcelain 2>/dev/null | head -n1 | awk '{print $2}')
    if [ -n "$branch" ]; then
        IFS='.' read -r -A array <<< "$branch"
        echo  "${array[1]}"
    fi
}

get_os () {
    case "$(uname -s)" in
        Linux) echo "";;
        Darwin) echo "󰀵";;
        *Windows*) echo "";;
        *) echo " ";;
    esac
}


PROMPT="[\$(get_os)] %F{cyan}%#%f %2~ %B(%n)%b %B%F{yellow}{\$(get_git_branch)}%f%b 
 %F{cyan}󱞪%f "

RPROMPT='%? %T %W'
