local function ShowGameResult(success)
    if success then
        lib.notify({
            title = 'Success!',
            description = 'You completed the minigame successfully!',
            type = 'success'
        })
    else
        lib.notify({
            title = 'Failed',
            description = 'Better luck next time!',
            type = 'error'
        })
    end
end

local function OpenMinigamesMenu()
    lib.registerContext({
        id = 'minigames_main',
        title = 'Minigames Selection',
        options = {
            {
                title = 'Basic Minigames',
                description = 'Simple games with adjustable difficulty',
                menu = 'difficulty_games',
                icon = 'gamepad'
            },
            {
                title = 'Advanced Minigames',
                description = 'More challenging puzzle-based games',
                menu = 'complex_games',
                icon = 'puzzle-piece'
            }
        }
    })

    lib.registerContext({
        id = 'difficulty_games',
        title = 'Basic Minigames',
        menu = 'minigames_main',
        options = {
            {
                title = 'Circle Timer',
                description = 'Time your click when the circle fills up',
                icon = 'circle',
                onSelect = function()
                    local input = lib.inputDialog('Circle Timer Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                        {type = 'number', label = 'Speed (1=Slow, 100=Fast)', default = 50},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:CircleProgress(input[1], input[2]))
                    end
                end
            },
            {
                title = 'Circle Mash',
                description = 'Rapidly shake to fill the circle',
                icon = 'circle-dot',
                onSelect = function()
                    local input = lib.inputDialog('Circle Mash Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                        {type = 'number', label = 'Speed Required (1=Slow, 100=Fast)', default = 50},
                        {type = 'number', label = 'Number of Keys to Mash', default = 5},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:CircleShake(input[1], input[2], input[3]))
                    end
                end
            },
            {
                title = 'Key Sequence',
                description = 'Press keys in a circular order',
                icon = 'keyboard',
                onSelect = function()
                    local input = lib.inputDialog('Key Sequence Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                        {type = 'number', label = 'Speed Required (1=Slow, 100=Fast)', default = 50},
                        {type = 'number', label = 'Keys in Sequence', default = 3},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:KeyCircle(input[1], input[2], input[3]))
                    end
                end
            },
            {
                title = 'Button Masher',
                description = 'Rapidly press keys to win',
                icon = 'keyboard',
                onSelect = function()
                    local input = lib.inputDialog('Button Masher Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                        {type = 'number', label = 'Speed Required (1=Slow, 100=Fast)', default = 50},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:KeySpam(input[1], input[2]))
                    end
                end
            },
            {
                title = 'Number Sequence',
                description = 'Press numbers in correct order',
                icon = 'sort-numeric-down',
                onSelect = function()
                    local input = lib.inputDialog('Number Sequence Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                        {type = 'number', label = 'Speed Required (1=Slow, 100=Fast)', default = 50},
                        {type = 'number', label = 'Numbers to Remember', default = 5},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:NumberSlide(input[1], input[2], input[3]))
                    end
                end
            },
            {
                title = 'Progress Timer',
                description = 'Stop the bar at the right time',
                icon = 'bars-progress',
                onSelect = function()
                    local input = lib.inputDialog('Progress Timer Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                        {type = 'number', label = 'Speed (1=Slow, 100=Fast)', default = 50},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:Progress(input[1], input[2]))
                    end
                end
            },
            {
                title = 'Line Runner',
                description = 'Draw lines quickly and accurately',
                icon = 'pencil',
                onSelect = function()
                    local input = lib.inputDialog('Line Runner Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                        {type = 'number', label = 'Speed Required (1=Slow, 100=Fast)', default = 50},
                        {type = 'number', label = 'Number of Lines', default = 5},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:RapidLines(input[1], input[2], input[3]))
                    end
                end
            }
        }
    })

    lib.registerContext({
        id = 'complex_games',
        title = 'Advanced Minigames',
        menu = 'minigames_main',
        options = {
            {
                title = 'Word Puzzle',
                description = 'Test your word skills',
                icon = 'font',
                onSelect = function()
                    local input = lib.inputDialog('Word Puzzle Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:WordWiz(input[1], {}))
                    end
                end
            },
            {
                title = 'Math Circles',
                description = 'Quick math in circles',
                icon = 'calculator',
                onSelect = function()
                    local input = lib.inputDialog('Math Circles Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:CircleSum(input[1], {}))
                    end
                end
            },
            {
                title = 'Number Memory',
                description = 'Remember and match numbers',
                icon = 'hashtag',
                onSelect = function()
                    local input = lib.inputDialog('Number Memory Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:DigitDazzle(input[1], {}))
                    end
                end
            },
            {
                title = 'Lights Puzzle',
                description = 'Turn off all the lights',
                icon = 'lightbulb',
                onSelect = function()
                    local input = lib.inputDialog('Lights Puzzle Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:LightsOut(input[1], {}))
                    end
                end
            },
            {
                title = 'Mine Field',
                description = 'Classic minesweeper game',
                icon = 'bomb',
                onSelect = function()
                    local input = lib.inputDialog('Mine Field Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:MineSweeper(input[1], {}))
                    end
                end
            },
            {
                title = 'Path Finder',
                description = 'Find the correct path through the maze',
                icon = 'route',
                onSelect = function()
                    local input = lib.inputDialog('Path Finder Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:PathFind(input[1], {}))
                    end
                end
            },
            {
                title = 'Wave Rider',
                description = 'Match the wave pattern perfectly',
                icon = 'wave-square',
                onSelect = function()
                    local input = lib.inputDialog('Wave Rider Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:WaveMatch(input[1], {duration = 5}))
                    end
                end
            },
            {
                title = 'Security Override',
                description = 'Hack through the security system',
                icon = 'lock',
                onSelect = function()
                    local input = lib.inputDialog('Security Override Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:PrintLock(input[1], {}))
                    end
                end
            },
            {
                title = 'Node Untangler',
                description = 'Untangle the connected nodes',
                icon = 'project-diagram',
                onSelect = function()
                    local input = lib.inputDialog('Node Untangler Settings', {
                        {type = 'number', label = 'Number of Attempts', default = 1},
                    })
                    if input then
                        ShowGameResult(exports['bl_ui']:Untangle(input[1], {}))
                    end
                end
            }
        }
    })

    lib.showContext('minigames_main')
end

exports.ox_target:addBoxZone({
    coords = vec3(214.45, -806.99, 30.81),
    size = vec3(1, 1, 2),
    rotation = 45,
    debug = false,
    options = {
        {
            name = 'open_minigames',
            icon = 'fas fa-gamepad',
            label = 'Play Minigames',
            onSelect = function()
                OpenMinigamesMenu()
            end
        }
    }
})