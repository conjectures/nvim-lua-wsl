local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
    return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
    return
end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,


            },
            n = {

                ["<j>"] = actions.move_selection_next,
                ["<k>"] = actions.move_selection_previous,

                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,

                ["<?>"] = actions.which_key,

            },
        },
    },
    pickers = {

    },
    extensions = {

    },
    find_files = {
        hidden = true
    }
})

--telescope.load_extension("fzf")
telescope.load_extension("diff")
