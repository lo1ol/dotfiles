if status is-interactive
    # Commands to run in interactive sessions can go here
end

export QT_QPA_PLATFORM=wayland

alias grep='grep --color=auto'
alias ls='ls --color=always'
alias ll='ls -la'

alias swayconf='nvim ~/.config/sway/config'
alias nvimconf='nvim ~/.config/nvim/init.lua'


export PATH="/opt/clang-format-static:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export LD_LIBRARY_PATH=/usr/local/lib

export TERMINAL=foot

autojump &> /dev/null

for file in $(ls -1 $HOME/.config/fish/*.fish | grep -v "config\.fish")
    source $file
end

function fish_right_prompt
  #intentionally left blank
 end

if [ $(tty) = "/dev/tty1" ] && [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ];
	#export WLR_NO_HARDWARE_CURSORS=1
	#export WLR_RENDERER=vulkan

    export MOZ_ENABLE_WAYLAND=1
    
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
    systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_TYPE

	# run sway on intel gpu
    if [ -e /dev/dri/card1 ];
        set val $(udevadm info -a -n /dev/dri/card1 | grep boot_vga | rev | cut -c 2)
	    export WLR_DRM_DEVICES="/dev/dri/card$val"
        exec sway --unsupported-gpu
    else
        exec sway
    end
end
