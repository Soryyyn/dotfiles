local jdtls = require("jdtls")

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
local lombok_path = jdtls_path .. '/lombok.jar'
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local function get_config_dir()
    -- Unlike some other programming languages (e.g. JavaScript)
    -- lua considers 0 truthy!
    if vim.fn.has('linux') == 1 then
        return 'config_linux'
    elseif vim.fn.has('mac') == 1 then
        return 'config_mac'
    else
        return 'config_win'
    end
end

require("jdtls").start_or_attach({
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. lombok_path,
        "-Xmx1G",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", launcher_jar,
        "-configuration", vim.fs.normalize(jdtls_path .. '/' .. get_config_dir()),
        "-data", vim.fn.expand('~/.cache/jdtls-workspace/') .. workspace_dir
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    -- NOTE: Copy-pasted from lsp config on attach func (ugly ik)
    on_attach = function(_, bufnr)
        vim.keymap.set(
            "n",
            "gr",
            "<CMD>Telescope lsp_references<CR>",
            { desc = "Show references", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "gd",
            "<CMD>Telescope lsp_definitions<CR>",
            { desc = "Show definition(s)", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            { desc = "Go to declaration", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "gi",
            "<CMD>Telescope lsp_implementations<CR>",
            { desc = "Show implementations", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "gt",
            "<CMD>Telescope lsp_type_definitions<CR>",
            { desc = "Show type definitions", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "K",
            vim.lsp.buf.hover,
            { desc = "Hover information", remap = true, silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "<leader>cf",
            vim.lsp.buf.format,
            { desc = "Format code", silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "<leader>cr",
            vim.lsp.buf.rename,
            { desc = "Rename variable", silent = true, buffer = bufnr }
        )
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })

        -- attach function signature help
        require("lsp_signature").on_attach({
            floating_window_above_cur_line = false,
            floating_window = false,
            hint_prefix = " ",
        }, bufnr)
    end
    ,
    init_options = {
        extendedClientCapabilities = jdtls.extendedClientCapabilities
    },
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
    settings = {
        eclipse = {
            downloadSources = true,
        },
        maven = {
            downloadSources = true,
        },
    }
})
