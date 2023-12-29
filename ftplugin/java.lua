local bo = vim.bo

bo.tabstop = 4 -- size of a hard tabstop (ts).
bo.shiftwidth = 4 -- size of an indentation (sw).
bo.expandtab = true -- always uses spaces instead of tab characters (et).
bo.softtabstop = 4 -- number of spaces a <Tab> counts for. When 0, feature is off (sts).

local home = string.sub(vim.fn.system("echo $HOME"), 0, -2)
local lombok_jar = home .. "/.local/share/eclipse/lombok.jar"
local jdtls_bin = string.sub(vim.fn.system("readlink -f $(which jdtls)"), 0, -2)
local jdtls_dir = string.sub(jdtls_bin, 0, -11)
local jdtls_jar = vim.fn.glob(jdtls_dir .. "/libexec/plugins/org.eclipse.equinox.launcher_*.jar")
local jdtls_conf = jdtls_dir .. "/libexec/config_mac"
local root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
    root_dir = root_dir,
	settings = {
		java = {
			import = {
				gradle = {
					annotationProcessing = { enable = true }
				},
			},
		},
	},
	init_options = {
		bundles = {}
	},
    cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:' .. lombok_jar,
		'-Xbootclasspath/a:' .. lombok_jar,
		'-jar', jdtls_jar,
		'-configuration', jdtls_conf,
		'-data', workspace_folder,
	},
}
require('jdtls').start_or_attach(config)
