local bo = vim.bo

bo.tabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
bo.softtabstop = 4

local home = string.sub(vim.fn.system("echo $HOME"), 0, -2)
local lombok_jar = home .. "/.local/share/eclipse/lombok.jar"
local jdtls_jar = vim.fn.glob(home .. "/.local/share/eclipse/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
local jdtls_conf = ""
if vim.loop.os_uname().sysname == "Linux" then
	jdtls_conf = home .. "/.local/share/eclipse/jdtls/config_linux"
elseif vim.loop.os_uname().sysname == "Darwin" then
	jdtls_conf = home .. "/.local/share/eclipse/jdtls/config_mac"
end
local root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
    root_dir = root_dir,
	settings = {
		java = {
			import = {
				gradle = {
					annotationProcessing = { enabled = true },
					wrapper = { enabled = true }
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
		'-Xmx8g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:' .. lombok_jar,
		'-jar', jdtls_jar,
		'-configuration', jdtls_conf,
		'-data', workspace_folder,
	},
}

require('jdtls').start_or_attach(config)
