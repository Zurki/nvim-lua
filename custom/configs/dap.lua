local dap = require'dap' -- https://github.com/xdebug/vscode-php-debug/releases -- Extract the vsix content

vim.fn.sign_define('DapBreakpoint', {
    text = '⬤',
    texthl = 'ErrorMsg',
    linehl = '',
    numhl = 'ErrorMsg'
})

vim.fn.sign_define('DapBreakpointCondition', {
    text = '⬤',
    texthl = 'ErrorMsg',
    linehl = '',
    numhl = 'SpellBad'
})

dap.adapters.spryker = {
    type = 'executable',
    command = 'nodejs',
    args = {"/opt/vscode-php-debug/out/phpDebug.js"},
}

dap.configurations.spryker = {
    {
        type = 'spryker',
        request = 'launch',
        name = 'Listen for xdebug',
        host = 'spryker',
        port = '80',
        log = false,
        pathMapping = {
          ['/src/'] = "${workspaceFolder}"
        }
    },
}

require("dapui").setup({
    layouts = {
        {
            elements = {
                {
                    id = "scopes",
                    size = 0.70
                },
                {
                    id = "breakpoints",
                    size = 0.10
                },
                {
                    id = "stacks",
                    size = 0.20
                }
            },
            position = "left",
            size = 50
        },
        {
            elements = {
                {
                    id = "repl",
                    size = 1
                }
            },
            position = "bottom",
            size = 10
        }
    },
})
