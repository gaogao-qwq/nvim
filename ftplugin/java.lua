local bo = vim.bo

bo.tabstop = 4 -- size of a hard tabstop (ts).
bo.shiftwidth = 4 -- size of an indentation (sw).
bo.expandtab = true -- always uses spaces instead of tab characters (et).
bo.softtabstop = 4 -- number of spaces a <Tab> counts for. When 0, feature is off (sts).

local jdtls_bin = string.sub(vim.fn.system('which jdtls'), 0, -2)

local config = {
    cmd = { jdtls_bin },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
}

require('jdtls').start_or_attach(config)
