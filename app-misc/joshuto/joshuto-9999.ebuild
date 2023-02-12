
EAPI=8


DESCRIPTION="Ranger-like terminal file manager written in Rust"

HOMEPAGE="https://github.com/kamiyaa/${PN}"

inherit git-r3 cargo
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="main"

LICENSE="GPL-3.0"
SLOT="0"
IUSE="X wayland +clipboard -fzf -zoxide"

DEPEND="fzf? ( app-shells/fzf )
        zoxide? ( app-shells/zoxide ) 
		clipboard? (
		X? ( x11-misc/xclip
			 x11-misc/xsel )
		wayland? ( gui-apps/wl-clipboard )
		)"
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

