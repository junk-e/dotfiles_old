function fish_prompt --description "Write out the prompt"

    set -l prompt_date (date "+%H:%M:%S")
    set -l prompt_userspace $USER@(prompt_hostname)
    set -l prompt_lt_bracket '[ '
    set -l prompt_rt_bracket ' ]'
    set -l prompt_separator ' | '

    # Suffix color and charactor definitions
    set -l color_suf
    set -l suffix
    switch "$USER"
        case root toor
            set color_suf red
            set suffix '# '
        case '*'
            set color_suf blue
            set suffix '% '
    end

    # First line
    set_color cyan
    printf '%s' $prompt_lt_bracket
    printf '%s' $prompt_date
    printf '%s' $prompt_separator
    printf '%s' (prompt_pwd)
    printf '%s' $prompt_rt_bracket
    set_color normal
    printf '%s' (__fish_git_prompt)
    printf '\n'

    # Second line
    set_color $color_suf
    printf '%s' $prompt_userspace
    printf '%s' $suffix
    set_color normal

end
# vim: set ft=conf :
