default:
	just --list

uninstall_jdtls:
	rm -r ~/.local/share/eclipse

install_jdtls:
	mkdir -p ~/.local/share/eclipse/jdtls
	wget -O ~/.local/share/eclipse/lombok.jar https://projectlombok.org/lombok-edge.jar
	wget -O ~/.local/share/eclipse/jdtls.tar.gz https://www.eclipse.org/downloads/download.php\?file\=/jdtls/snapshots/jdt-language-server-latest.tar.gz
	tar xf ~/.local/share/eclipse/jdtls.tar.gz --directory=$HOME/.local/share/eclipse/jdtls
