local api = vim.api

return {
    "Kurama622/profile.nvim",
    lazy = false,
    event = "VimEnter",
    dependencies = { "3rd/image.nvim", opts = {} },

    config = function()
        local comp = require("profile.components")
        local win_width = vim.o.columns

        if not win_width or win_width < 20 then
            win_width = 20
        end

        vim.api.nvim_set_hl(0, "ProfilePurple", { fg = "#C678DD", bold = true })
        vim.api.nvim_set_hl(0, "ProfilePurpleBold", { fg = "#A9A1E1", bold = true })
        vim.api.nvim_set_hl(0, "ProfileWhite", { fg = "#FFFFFF" })

        require("profile").setup({
            avatar_path = "/home/NIZ00LAX/.config/nvim/lua/resources/WORLD.jpg",

            avatar_opts = {
                avatar_width = 20,
                avatar_height = 20,
                avatar_x = math.floor((win_width - 20) / 2),
                avatar_y = 7,
                force_blank = false,
            },

            github_username = "NickHubDev",

            git_contributions = {
                start_week = 1,
                end_week = 52,
                empty_char = " ",
                full_char = { "*", "*", "*", "-", "*" },
                fake_contributions = nil,
            },

            hide = {
                statusline = true,
                tabline = true,
            },

            disable_keys = {
                "h",
                "j",
                "k",
                "<Left>",
                "<Right>",
                "<Up>",
                "<Down>",
                "<C-f>",
            },

            cursor_pos = { 0, 0 },

            format = function()
                local header = {
                    [[                         .,:::,,.                  .,::::,.                         ]],
                    [[                     .,;iI|+~~!Ii,                ,iI!~~+|Ii:,.                     ]],
                    [[                 ..:;t|~>W○◙◙◙◙○I;.              .;l○◙◙◙◙○M>+lt;,..                 ]],
                    [[               .,il!<#○◙◙◙◙◙◙◙○◘I;.  ...    ...  .;l○○○◙◙◙◙◙◙◙#=+=Ii,.              ]],
                    [[             .,il=W◙◙◙◙◙◙◙◙◙◙○M+1:.,;i11i;;i11i:,.:t+M○◙◙◙◙◙◙◙◙◙◙W~Ii,.             ]],
                    [[           .,;I~#◙◙◙◙◙◙◙◙◙◙◙◙○M+t::iI○◙><<<<>◙○I;:;t~W○◙◙◙◙◙◙◙◙◙◙◙◙M~I;,            ]],
                    [[          ,;t+*○◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙○!tiI~○◙◙◙◙◙◙◙◙◙+I1t+◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙○*+t;,          ]],
                    [[        .,1!>○◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙○#=+=M○◙◙◙◙◙◙◙◙○#=+=M○◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙○○>|i,         ]],
                    [[        ,1!◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙@○◙◙◙◙◙◙◙◙◙◙◙◙◙○♣%◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙○!1,        ]],
                    [[       ,1!#◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙*|i,       ]],
                    [[      .;|○◙◙◙◙◙◙○◙○○○◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙○○○○◙◙◙◙◙◙◙○○l;.      ]],
                    [[      ,1+◙◙◙◙◙◙◙○*<=<#○◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙#<=<#○◙◙◙◙◙◙◙!i,      ]],
                    [[      ,1+◙◙◙◙M<+l1i;iI~M○◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙○M+Ii;itl+<M◙◙◙◙!i,      ]],
                    [[      .;I◙○=!Ii:,.  .:I=○◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙○~t:.  .,:iI+=○◙I;.      ]],
                    [[       ,;i1i;,.      ,il○◙*><<#&◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙%#<<>>◙○Ii.      .,;11i;,       ]],
                    [[        ....         .,;111i;it!*☺◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙$*!ti;i11i;,          ...         ]],
                    [[                        ...   ,1!▓◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙*!i,   ...                       ]],
                    [[                              .:I%○█W&$○◙◙◙◙○$&M♣◙!t:.                               ]],
                    [[                               ,;1tII|<○◙◙◙◙○=|IIt1:.                                ]],
                    [[                                ....,;I~#○○#+t;,....                                 ]],
                    [[                                     .;I~○○+I;.                                     ]],
                    [[                                      ,il○○li,                                      ]],
                    [[                                      .:i11;:.                                      ]],
                    [[                                        ....                                        ]],
                }

                for _, line in ipairs(header) do
                    comp:text_component_render({
                        comp:text_component(line, "center", "ProfileWhite"),
                    })
                end

                comp:text_component_render({
                    comp:text_component("git@github.com:NickHubDev/KNIGHTVIM", "center", "ProfileWhite"),
                    comp:text_component("──── By NIZ00LAX", "right", "ProfileWhite"),
                })

                comp:separator_render()
                comp:separator_render()
                comp:git_contributions_render()
            end,
        })

        api.nvim_set_keymap("n", "<leader>p", "<cmd>Profile<cr>", { silent = true })
    end,
}
