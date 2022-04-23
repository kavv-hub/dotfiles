export AWS_PROFILE=app-non-prod
export AWS_REGION=ap-southeast-1

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

source ~/.asdf/asdf.fish

