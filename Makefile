build: lua/cosmic_gleam/*
	nvim --headless --clean -c "set rtp+=." \
		-c 'lua require("cosmic_gleam.build").build()' \
		-c 'quit'
