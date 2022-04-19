# Build Neovim separately in the first stage
FROM alpine:latest AS base

RUN apk --no-cache add \
	autoconf \
	automake \
	build-base \
	cmake \
	ninja \
	coreutils \
	curl \
	gettext-tiny-dev \
	git \
	libtool \
	pkgconf \
	unzip

# Clone Neovim's source code to be built on * used as a base
# RUN git clone https://github.com/neovim/neovim.git
#
# # Build Neovim from it's source code
# ARG VERSION=master
# RUN cd neovim && git checkout ${version} && make CMAKE_BUILD_TYPE=RelWithDebInfo install
#
# # Supporting dependencies required for Jarvim to work nicely
# # TODO: Add the remaining other requirements as & when required
# RUN apk --no-cache add \
# 	git \
# 	ctags
#
# COPY ./configs /root/.config/nvim
#
# WORKDIR /neovim
