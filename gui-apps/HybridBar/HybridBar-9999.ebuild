
EAPI=8


DESCRIPTION="A status bar focused on wlroots Wayland compositors "

HOMEPAGE="https://github.com/vars1ty/${PN}"

inherit git-r3 cargo
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="main"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="gui-libs/gtk-layer-shell
		x11-libs/gtk+:3"
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

src_install(){
	cargo_src_install
	mv ${S}/examples ${S}/HybridBar
	insinto /etc/xdg
	doins -r "${S}/${PN}"

}

