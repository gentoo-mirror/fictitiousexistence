
EAPI=8


DESCRIPTION="Minimalistic program launcher written in Rust - Alternative to bemenu/demu/rofi"

HOMEPAGE="https://github.com/j0ru/${PN}"

inherit git-r3 cargo
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="main"

LICENSE="GPL-3.0"
SLOT="0"

DEPEND=""
BDEPEND="virtual/rust"


src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
}

src_prepare() {
	default
}


src_compile(){
	cargo_src_compile
}

src_compile(){
	cargo_src_install
}

elog "Copy config template from $XDG_CONFIG_HOME/kickoff/config.toml to ~/.config/kickoff/config.toml"
