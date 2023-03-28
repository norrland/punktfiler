local nvim_lsp = require("lspconfig")

local on_attach = function()
    local opts = {buffer = 0}
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<Leader>d", "<cmd>Telescope diagnostics<CR>", opts)
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, opts)

    require("vim.lsp.protocol").CompletionItemKind = {
        "", -- Text
        "", -- Method
        "", -- Function
        "", -- Constructor
        "", -- Field
        "", -- Variable
        "", -- Class
        "ﰮ", -- Interface
        "", -- Module
        "", -- Property
        "", -- Unit
        "", -- Value
        "", -- Enum
        "", -- Keyword
        "", -- Snippet
        "", -- Color
        "", -- File
        "", -- Reference
        "", -- Folder
        "", -- EnumMember
        "", -- Constant
        "", -- Struct
        "", -- Event
        "ﬦ", -- Operator
        "" -- TypeParameter
    }
end

local function make_config()
    return {on_attach = on_attach}
end

local servers = {"elixirls", "gopls", "tsserver"}

for _, lsp in ipairs(servers) do
    local config = make_config()

    if lsp == "elixirls" then
        config.settings = {
            elixirLS = {dialyzerEnabled = false}
        }
        config.cmd = {"elixir-ls"}
    end

    if lsp == "gopls" then
        config.filetypes = {'go', 'gomod'}
        --config.cmd={ 'gopls', 'serve' },
        config.settings = {
            gopls = {
                analyses = {
                    assign = true,
                    atomic = true,
                    bools = true,
                    composites = true,
                    copylocks = true,
                    deepequalerrors = true,
                    embed = true,
                    errorsas = true,
                    fieldalignment = true,
                    httpresponse = true,
                    ifaceassert = true,
                    loopclosure = true,
                    lostcancel = true,
                    nilfunc = true,
                    nilness = true,
                    nonewvars = true,
                    printf = true,
                    shadow = true,
                    shift = true,
                    simplifycompositelit = true,
                    simplifyrange = true,
                    simplifyslice = true,
                    sortslice = true,
                    stdmethods = true,
                    stringintconv = true,
                    structtag = true,
                    testinggoroutine = true,
                    tests = true,
                    timeformat = true,
                    unmarshal = true,
                    unreachable = true,
                    unsafeptr = true,
                    unusedparams = true,
                    unusedresult = true,
                    unusedvariable = true,
                    unusedwrite = true,
                    useany = true,
                    staticcheck = true,
                },
            },
            hoverKind = "FullDocumentation",
            linkTarget = "pkg.go.dev",
            usePlaceholders = true,
            vulncheck = "Imports",
        }
    end

    nvim_lsp[lsp].setup(config)
end
