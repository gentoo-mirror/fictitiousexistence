# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8



DESCRIPTION="Nyxt - the internet on your terms."

HOMEPAGE="https://nyxt.atlas.engineer/"

inherit git-r3 xdg
EGIT_REPO_URI="https://github.com/atlas-engineer/nyxt"
EGIT_SUBMODULES=( '*' )
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/nyxt"
S="${EGIT_CHECKOUT_DIR}"

LICENSE="BSD CC-BY-SA-3.0"
SLOT="0/9999"
IUSE="X spell"
RESTRICT='strip'

DEPEND="net-libs/webkit-gtk:4.1
	dev-libs/gobject-introspection
	net-libs/glib-networking
	gnome-base/gsettings-desktop-schemas
	sys-libs/libfixposix
	X? ( x11-misc/xclip )
	spell? ( app-text/enchant )"

BDEPEND="
	>=dev-lisp/sbcl-2.0.0
"
src_compile(){
	elog 'skip to install'
}


src_install() {
	env PREFIX=/usr DESTDIR=${D} emake all install || die emake failed
}

pkg_postinst(){
	xdg_pkg_postinst
}

pkg_postrm(){
	xdg_pkg_postrm
}
