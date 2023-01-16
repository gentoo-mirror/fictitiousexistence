# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit xdg

DESCRIPTION="Nyxt - the internet on your terms."

HOMEPAGE="https://nyxt.atlas.engineer/"

SRC_URI="https://github.com/atlas-engineer/nyxt/releases/download/3-pre-release-2/nyxt-3-pre-release-2-source-with-submodules.tar.xz"

S="${WORKDIR}"


KEYWORDS="~amd64"
LICENSE="BSD CC-BY-SA-3.0"
SLOT="0"
IUSE="X spell"
RESTRICT="strip"

DEPEND="net-libs/webkit-gtk
	dev-libs/gobject-introspection
	net-libs/glib-networking
	gnome-base/gsettings-desktop-schemas
	sys-libs/libfixposix
	X? ( x11-misc/xclip )
	spell? ( app-text/enchant )"
BDEPEND=">=dev-lisp/sbcl-2.0.0"

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


