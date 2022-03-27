# Jarvim: A Sensible IDE-like Configured Environment for Neovim

![GitHub repo size](https://img.shields.io/github/repo-size/Jarmos-san/jarvim?label=Repo%20Size&logo=GitHub&style=flat-square)
[![Sponsor](https://img.shields.io/badge/Sponsor-With%20a%20Coffee%2FBook-yellow)](https://www.buymeacoffee.com/jarmos)
[![GitHub](https://img.shields.io/github/license/Jarmos-san/Jarvim?label=License&logo=GitHub&style=flat-square)](./LICENSE)
![Twitter Follow](https://img.shields.io/twitter/follow/Jarmosan?style=social)

## About the Project

If you've used Vim even briefly before, you would know configuring the editor to
fit your specific development needs is a time-consuming undertaking. But
fortunately, there are quite a lot of "_Neovim configuration frameworks_" out
there & Jarvim is one of them as wekk!

But unlike the other alternatives out there, Jarvim attempts to stay out of the
way of the developer as much as possible. It'll only provide you with a "_bare
minimum_" set of configurations to give you an IDE-like experience.

Now a "_bare minimum_" can be interpreted differently based on who you're asking
& that's OK too! You can trim out the unecessary configurations (_which you feel
isn't a necessity_) whenever you want to.

That said, following are some core IDE-like features which Jarvim provides &
configures automatically for you:

- Language Server Protocol (LSP) with autocompletion, snippet support & much
  more.
- Faster & smarter syntax highlighting with Treesitter.
- Better file explorer & navigation.
- Integrated plugin management configurations

_...more such core IDE-like features will be added if/when I come across any.
But if you believe I missed out on some core IDE-like feature, let me know about
it!_

## Goals of the Project

As mentioned earlier, a handful of similar projects already exists -
[LunarVim](https://github.com/LunarVim/LunarVim),
[NvChad](https://github.com/NvChad/NvChad) & so on. These projects provide
configurations which are tightly coupled & hence are difficult to customise to
suit a user's personalized needs. As such, Jarvim tries to resolve those
concerns by stay out of the way of the user's opinion & their needs.

The goals of Jarvim is minimal, simple & unopinionated which means you're in
control of how your Neovim experience will be. And Jarvim is nothing more than a
helping hand to get you started on that journey! 😆

That said, here are the goals of the project:

- **Provide an IDE-like Behaviour**: Jarvim aims to provide an IDE-like
  experience right out-of-the-box. You no longer have to spend hours (or even
  days) gettings things right. So, expect some core IDE-like features to just
  work out-of-the-box.
- **Customizability**: Jarvim tries not to impose any hard-coded behaviour.
  You're free to discard pieces of code or add on top of it as you deem fit.
- **Extensibility**: Jarvim tries not to impose its opinion as much as possible.
  You, as the user, have the ultimate right to configure your Neovim experience
  as you like.
- **Documentation**: Customizing & extending default behaviour isn't possible
  (or at least quite difficult) without having proper documentation in place.
  Hence, expect jarvim's source code to be heavily commented & documented where
  possible.
- **Minimalist Experience**: Subjectively speaking, Jarvim mightn't be minimal
  enough for some & that's fine. Jarvim adheres to provide a very "**minimal
  IDE-like experience**" within Neovim while still keeping in mind the above
  goals.

## Supported Operating Systems & Environments

Jarvim has been extensively tested & developed on an Unix-like environment. And
hence, it's **recommended** to use Jarvim on a Unix-based system as well. So, if
you're a Mac/Linux user then you're good to go! But hard luck for all Windows
users out there.

The decision to support only Unix-based systems has been made after genuine
considerations of the lack of good `gcc` alternatives on Windows 10/11. Without
`gcc` Treesitter willn't work as expected & you'll run into hard-to-debug build
errors.

But on a brighter note, you can now use Windows Subsystem for Linux (WSL) on
both Windows 10/11. enabling you to use a Linux environment right within
Windows. You can use Jarvim there instead & you'll not face any issues.

That said, before installing Jarvim, please run the following command to check
all dependencies of the project exists & is available on `PATH` in your system:

<!-- markdownlint-disable -->

```
curl -fsSL https://tiny.one/check-jarvim-dependencies | bash
```

<!-- markdownlint-disable -->

## Installation Procedures

Once you performed a customary check for all the necessary dependencies, its
time to install Jarvim now.

Jarvim has been kept easy-to-install with an intention which means you only need
to invoke a single `curl` command & you're all set! As such the following
command will download the Jarvim configurations to your system, install the
necessary plugins & configure the editor as specified!

```shell
curl -fsSL https://tiny.one/install-jarvim | bash
```

Yes, it's that simple to install!

## Usage Disclaimer

Please bear in mind, Jarvim is nowhere production-ready! As Neovim develops, so
will Jarvim. For example, as the Neovim core devs are in talks for pushing a
major refactor of the LSP API. And chances are, in the near future it might be
easier to download & setup individual server with much more ease.

The upcoming Neovim v0.7 will also bring new features & major changes to the
`vim` "_standard library_" as well. For example, you might now be able to define
Autocommands with Lua. And there'll be a convenient function to setup keymaps as
well! Whenever these features & core changes are introduced to production on the
`master` branch, Jarvim will be updated accordingly.

And hence, use Jarvim if stability isn't a concern for you!

That said, the following features (or tasks) are either complete/WIP:

- [x] Bare minimum aesthetics like statusline, colorscheme (which is subject to
      change), indents (buggy as of latest commit), treesitter-based syntax
      highlighting, etc.
- [x] Some bare minimum Treesitter parsers for JSON, Markdown, YAML & TOML
      files.
- [x] Configure package manager (used
      [`package.nvim`](https://github.com/whbthomason/package.nvim) because of
      its popularity).
- [ ] Lazy-load all plugin configurations.
- [x] Enable & configure a file-explorer plugin for easier navigation across
      files & directories.
- [x] Enable version-control support for `git`.
- [ ] Enable & configure LSP.
- [ ] Document all configurations for easier reference.

_... the list isn't complete & will be updated as & when I come up with more
ideas!_

## Credits & Acknowledgement

Jarvim stands on the shoulders of the giants within the Neovim community.
Without their work & inspiration, Jarvim would've never seen the light of the
day. So, if you found Jarvim helpful, do take some time out & check out those
projects as well.

- [LunarVim](https://github.com/LunarVim/LunarVim) maintained by
  [Christian Chiarulli](https://github.com/ChristianChiarulli)
- [disrupted/dotfiles](https://github.com/disrupted/dotfiles/tree/master/.config/nvim)
  maintained by [Salomon Popp](https://github.com/disrupted)
- [NvChad/NvChad](https://github.com/NvChad/NvChad) maintained by
  ["Siduck"](https://github.com/siduck76)

## Contribute to & Support the Project

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/H2H567ZQH)

Jarvim started out as personal requirement but there's only so much progress a
single person can make for the project. Hence, any sort of support &
contributions to the project are heartily welcomed! And here's how you can
contribute and/or support the project:

1. Contributing by reporting issues, bugs & improvements.
2. Offer a helping hand by reaching out as a co-maintainer of the project.
3. Send a [simple "thank you" message](https://saythanks.io/to/Jarmos-san) if
   the project helped you out in any way.
4. And/or [buy me a book](https://www.buymeacoffee.com/jarmos) which you think I
   should definitely give a read!

And for the interested contributors (and/or maintainers) out there, please give
the [**CONTRIBUTION**](./.github/CONTRIBUTING.md) guidelines a thorough read
before sending a PR or two.

## License & Usage Terms & Conditions

All the source code developed in this project are licensed under the T&Cs of the
MIT license unless otherwise noted. So, you're free to copy & distribute it as
you wish but with due credit & acknowledgement. For more information, refer to
the [LICENSE](./LICENSE).
