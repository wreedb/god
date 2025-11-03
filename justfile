# SPDX-FileCopyrightText: 2025 2025 Will Reed <wreed@disroot.org>
#
# SPDX-License-Identifier: GFDL-1.3-or-later

@build:
    @mdbook build spec

@serve:
    @mdbook serve spec --open
