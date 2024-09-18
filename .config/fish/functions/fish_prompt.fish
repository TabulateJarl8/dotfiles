function fish_prompt
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
end
