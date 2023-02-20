
EAPI=8


DESCRIPTION="Unofficial Bitwarden cli"

HOMEPAGE="https://github.com/doy/${PN}"

inherit git-r3 cargo
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"

DEPEND="app-crypt/pinentry"
BDEPEND="virtual/rust"


src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack

}

src_prepare() {
	default
}


src_compile(){
	export CARGO_PROFILE_RELEASE_LTO=true
	cargo_src_compile

  # generate shell auto-completions
  for completion in bash fish zsh; do
    cargo run --frozen --release --bin rbw -- \
      gen-completions "$completion" > "$completion-completions"
  done
}

src_install() {
	cargo_src_install

	insinto /usr/share/bash-completion/completions/
	newins bash-completions rbw
	insinto /usr/share/fish/vendor_completions.d/
	newins fish-completions rbw.fish
	insinto /usr/share/zsh/site-functions/
	newins zsh-completions _rbw



}

elog "To use multiple profiles set env variable RBW_PROFILE=<profileName>"
