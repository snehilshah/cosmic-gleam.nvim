build: lua/cosmic_gleam/*
	nvim --headless -u NORC \
		--cmd 'lua require("cosmic_gleam.build").build()' \
		--cmd 'quit'
