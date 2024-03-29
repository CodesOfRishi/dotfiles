-- vim.g.nvim_tree_side = 'left' -- left by default
-- vim.g.nvim_tree_width = 40 -- 30 by default, can be width_in_columns or 'width_in_percent%'
-- vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
-- vim.g.nvim_tree_gitignore = 1 -- 0 by default
-- vim.g.nvim_tree_auto_open = 0 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
-- vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
-- vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
-- vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
-- vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
-- vim.g.nvim_tree_hide_dotfiles = 0 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
-- vim.g.nvim_tree_tab_open = 1 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
-- vim.g.nvim_tree_auto_resize = 0 -- 1 by default, will resize the tree to its saved width when opening a file
-- vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disables netrw
-- vim.g.nvim_tree_hijack_netrw = 1 -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
-- vim.g.nvim_tree_lsp_diagnostics = 1 -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
-- vim.g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
-- vim.g.nvim_tree_hijack_cursor = 0 -- 1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
vim.g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
-- vim.g.nvim_tree_update_cwd = 1 -- 0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
-- vim.g.nvim_tree_window_picker_exclude = { 
-- 	buftype = { 
-- 		'terminal'
--     }
-- }
-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
-- vim.g.nvim_tree_special_files = { 'README.md' = 1, 'Makefile' = 1, 'MAKEFILE' = 1 } -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 1,  }
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
	default =  '',
	symlink =  '',
	git =  {
		unstaged =  "✗",
		staged =  "✓",
		unmerged =  "",
		renamed =  "➜",
		untracked =  "★",
		deleted =  "",
		ignored =  "◌"
	},
	folder =  {
		arrow_open =  "",
		arrow_closed =  "",
		default =  "",
		open =  "",
		empty =  "",
		empty_open =  "",
		symlink =  "",
		symlink_open =  "",
	},
	lsp = {
		hint =  "",
		info =  "",
		warning =  "",
		error =  "",
	}
}

-- require 'nvim-tree'.setup{}
require 'nvim-tree'.setup{
	update_cwd = true,
	disable_netrw = false,
	hijack_cursor = false,
	renderer = {
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = true,
		ignore_list = {},
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	open_on_setup = false,
	open_on_tab = false,
	filters = {
		dotfiles = false,
		custom = { '.git', 'node_modules', '.cache' },
		exclude = {}
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400
	},
	hijack_netrw = true,
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = left,
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = yes
	}
}
