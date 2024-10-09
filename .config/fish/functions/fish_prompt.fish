function fish_prompt
	if [ "$hostname" = "xenon" ]
		set_color brgreen
		echo -n "[$USER"
		echo -n "@"
		echo -n (uname -n)
		set_color normal
		if [ "$PWD" = "$HOME" ]
			set pwd "~"
		else
			set pwd (basename $PWD)
		end
		echo -n " $pwd"
		set_color brgreen
		echo ']$ '
	else
		set_color -o brgreen
		echo -n (uname -n)
		set_color normal
		echo -n ':'
		set_color red
		echo -n '['
		set_color -o brblue
		echo -n $USER
		set_color red
		echo -n ']'
		set_color normal
		echo -n ':'
		set_color magenta
		echo -n (dirs)
		set_color -o bryellow
		echo -n '$ '
		set_color normal
	end
end
