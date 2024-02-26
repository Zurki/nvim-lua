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

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/hhornschuh/.config/nvim/debug/php/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003
  }
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
