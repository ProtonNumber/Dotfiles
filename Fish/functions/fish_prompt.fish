function fish_prompt
	# When running as root, print the hostname in red bold text,
	# otherwise print username & hostname in regular green
	if functions -q fish_is_root_user; and fish_is_root_user
		set -f login (set_color --bold red)"$hostname"
		set -f suffix "# "
	else
	        set -f login (set_color brgreen)"$USER@$hostname"
		set -f suffix "> "
	end
	set -l path (set_color blue)(prompt_pwd)
	
	echo "$login $path $suffix"
end


