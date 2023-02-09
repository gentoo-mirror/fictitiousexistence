
EAPI=8



DESCRIPTION="Wayland Clipboard Manager"

HOMEPAGE="https://github.com/sentriz/cliphist"

inherit git-r3 go-module
EGIT_REPO_URI="https://github.com/sentriz/cliphist.git"
EGIT_BRANCH="master"
#EGIT_CHECKOUT_DIR="${WORKDIR}/cliphist"
#S="${EGIT_CHECKOUT_DIR}"

LICENSE="GPL-3.0"
SLOT="0/9999"
#RESTRICT='strip'

DEPEND="dev-lang/go
		x11-misc/xdg-utils
		gui-apps/wl-clipboard"

BDEPEND=""

src_compile(){
	ego build
}


src_install() {
	dobin cliphist
	default
}

