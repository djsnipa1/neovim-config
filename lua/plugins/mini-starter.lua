-- {{{
local animation = function()
    local stickFigure = {
        ' O \n/|\\\n /\\',
        ' O \n\\|/\n /\\',
        ' O \n/|\\\n /\\',
        ' O \n\\|/\n /\\'
    }
    local position = 1
    local direction = 1

    while true do
        os.execute('clear') -- clear the console
        print(stickFigure[position]) -- print the current frame
        os.execute('sleep 0.2') -- wait for a short time

        -- update the position and direction for the next frame
        position = position + direction
        if position == #stickFigure then
            direction = -1
        elseif position == 1 then
            direction = 1
        end
    end
end

-- }}}

local nixlogo = table.concat(
    {
        '⠀⠀⠀⠀⠰⣿⣧⠀⠀⠹⣿⣧⡀⣼⣿⠆⠀⠀⠀⠀',
        '⠀⠀⠀⣀⣀⣹⣿⣧⣀⣀⣘⣿⣿⣿⠏⠀⠀⠀⠀⠀',
        '⠀⠀⠼⠿⠿⢿⣿⣿⠿⠿⠿⠞⣿⣿⡀⠀⣼⣧⠀⠀',
        '⠀⠀⠀⠀⢠⣾⡿⠁⠀⠀⠀⠀⠈⢿⣿⣼⣿⠋⠀⠀',
        '⢾⣿⣿⣿⣿⡿⡁⠀⠀⠀⠀⠀⠀⢈⣾⣿⣿⣿⣿⡷',
        '⠀⠀⣠⣿⡟⢿⣷⡀⠀⠀⠀⠀⢀⣾⡿⠃⠀⠀⠀⠀',
        '⠀⠀⢻⡟⠀⠈⣿⣿⡴⣶⣶⣶⣿⣿⣷⣶⣶⡖⠀⠀',
        '⠀⠀⠀⠀⠀⣰⣿⣿⣿⣍⠉⠉⢻⣿⣏⠉⠉⠀⠀⠀',
        '⠀⠀⠀⠀⠰⣿⡟⠀⢻⣿⣆⠀⠀⢻⣿⠆⠀⠀⠀⠀',
        '                    ',
        'b.',
        '88b',
        '888b.',
        '88888b',
        '888888b.',
        '8888P"',
        'P" `8.',
        '    `8.',
        '     `8',
        '       ┏┓┓┳━┓┏━┓┓ ┳o┏┏┓',
        '       ┃┃┃┣━ ┃ ┃┃┏┛┃┃┃┃',
        '       ┇┗┛┻━┛┛━┛┗┛ ┇┛ ┇'
    }, '\n'
)

local cassette = table.concat(
    {
        ' __________________________________________________',
        '|  ______________________________________________  |',
        '| /    .----------------------o------------.     \\ |',
        '| |    |   .--. .-. .-..    ._.  .--.--.   |     | |',
        '| |    |   |  |(.-\'(   )\\  /  |  |  |  |   |     | |',
        '| |    `---\'  `-`--\'`-\'  `\' -\' `-\'  \'  `---\'     | |',
        '| |                  .........                   | |',
        '| |       / /-\\ \\   |         |   / /-\\ \\        | |',
        '| |      | |( )| |  |_________|  | |( )| |       | |',
        '| |       \\ \\-/ /   :....:....:   \\ \\-/ /        | |',
        '| |                                              | |',
        '| `_________ ____________________ ____ __________\' |',
        '|           /    []             []    \\            |',
        '|          /  ()                   ()  \\           |',
        '!_________/_____________________________\\__________!'
    }, '\n'
)
local turntables = table.concat(
    {
        '                    ___                                          ___',
        ' __________________/  /                       __________________/  /',
        '| _    _______    /  /                       | _    _______    /  / ',
        '|(_) .d########b. //)| _____________________ |(_) .d########b. //)| ',
        '|  .d############//  ||        _____        ||  .d############//  | ',
        '| .d######""####//b. ||() ||  [JAY C]  || ()|| .d######""####//b. | ',
        '| 9######(  )#_//##P ||()|__|  | = |  |__|()|| 9######(  )#_//##P | ',
        '| \'b######++#/_/##d\' ||() ||   | = |   || ()|| \'b######++#/_/##d\' | ',
        '|  "9############P"  ||   ||   |___|   ||   ||  "9############P"  | ',
        '|  _"9a#######aP"    ||  _   _____..__   _  ||  _"9a#######aP"    | ',
        '| |_|  `""""\'\'       || (_) |_____||__| (_) || |_|  `""""\'\'       | ',
        '|  ___..___________  ||_____________________||  ___..___________  | ',
        '| |___||___________| |    ┏┓┓┳━┓┏━┓┓ ┳o┏┏┓   | |___||___________| | ',
        '|____________________|    ┃┃┃┣━ ┃ ┃┃┏┛┃┃┃┃   |____________________| ',
        '                          ┇┗┛┻━┛┛━┛┗┛ ┇┛ ┇                          '
    }, '\n'
)

return {
    {
        'echasnovski/mini.starter',
        opts = function()
            -- get the window width
            local width = vim.api.nvim_win_get_width(0)
            -- divide in half
            local half_width = width / 2
            -- subtract by half the length of the longest menu item (Recent files)
            local final_width = half_width - (12 / 2)

            local pad = string.rep(' ', final_width)
            local new_section = function(
                name, action, section
            )
                return {
                    name = name,
                    action = action,
                    section = pad .. section
                }
            end

            local starter = require('mini.starter')
            -- stylua: ignore
            local config = {
                evaluate_single = true,
                header = turntables,
                items = {
                    new_section(
                        'Find file', 'Telescope find_files',
                            'Telescope'
                    ),
                    new_section(
                        'Recent files',
                            'Telescope oldfiles',
                            'Telescope'
                    ),
                    new_section(
                        'Grep text', 'Telescope live_grep',
                            'Telescope'
                    ),
                    new_section(
                        'init.lua', 'e $MYVIMRC', 'Config'
                    ),
                    new_section('Lazy', 'Lazy', 'Config'),
                    -- new_section("New file", "ene | startinsert", "Built-in"),
                    new_section('Quit', 'qa', 'Built-in')
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(
                        pad .. '░ ', false
                    ),
                    starter.gen_hook.aligning(
                        'center', 'center'
                    )
                }
            }
            return config
        end
    }
}
