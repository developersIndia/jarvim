# Jarvim: A Sensible IDE-like Configured Environment for Neovim

![GitHub repo size](https://img.shields.io/github/repo-size/Jarmos-san/jarvim?label=Repo%20Size&logo=GitHub&style=flat-square)
[![Sponsor](https://img.shields.io/badge/Sponsor-With%20a%20Coffee%2FBook-yellow)](https://www.buymeacoffee.com/jarmos)
[![GitHub](https://img.shields.io/github/license/Jarmos-san/Jarvim?label=License&logo=GitHub&style=flat-square)](./LICENSE)
![Twitter Follow](https://img.shields.io/twitter/follow/Jarmosan?style=social)

![Jarvim's cover image](./assets/Jarvim.png)

**DISCLAIMER**: This project is a Work-in-Progress project & isn't ready to be
used yet! Please wait till the first Minor version is released. And even then
expect to come across a few breaking changes. If you come across any breaking
changes, feel free to open an
[Issue thread](https://github.com/Jarmos-san/jarvim/issues/new/choose).

## About the Project

If you've used Vim even briefly before, you would know, configuring the editor
to fit your development requirements is a time-consuming undertaking. For some
of us, customizing our Vim experience is a never-ending process. Is that a
productive activity? I don't think so.

For the busy peeps out there, or even the lazy ones, Jarvim tries to resolve a
major problem for you. It tries to provide a sensible IDE-like experience with
an invocation of a single shell command!

So, if you're an experienced Vim user or perhaps you've just started dipping
your feet into Vim recently, then give Jarvim a try. Who knows it might help you
out with not miss your old IDE & might end up liking Vim as well.

## Goals of the Project

Lots other similar projects already exist if you're aware of the Vim community.
Some such projects include; [LunarVim](https://github.com/LunarVim/LunarVim),
[NvChad](https://github.com/NvChad/NvChad) & so on. So, Jarvim has to deliver
something different the other mature projects doesn't. As such, the project has
stric adherances to the following goals.

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

## Prerequisites & Good-to-Know Info

For Jarvim to provide an IDE-like experience it requires some prerequisite
dependencies to work properly. Hence, here's a brief list of all the caveats you
need to be aware of before using Jarvim.

"_Dependencies_" for Jarvim:

- `git` for [`packer.nvim`](https://github.com/wbthomasan/packer.nvim).
- `gcc` for
  [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)

**NOTE**: For all Windows users out there, please save yourself the pain & use
Neovim inside a WSL environment instead. It's a pain to set up Treesitter to
work properly on Windows 10/11. If you still feel adventurous, refer to the
official `nvim-treesitter` wikia.

## Installation Procedures

Jarvim is super easy to install, you only got to invoke a single line of Shell
command to download & setup the configurations! So, here's how you can get them
based on the platform of your choice.

**NOTE**: For Windows 10/11 users out there, use
[Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl)

```shell
curl -fsSL https://raw.githubusercontent.com/Jarmos-san/jarvim/main/scripts/install.sh | bash
```

**Disclaimer**: Its never recommended to run arbitrary shell scripts for obvious
security reasons! So, it's strongly suggested to take a look at what the script
does before executing it.

## TODO & Yet-To-Be Added Features

Jarvim offers the user to setup a variety of modern IDE-like features to Neovim
without the pain of spending days or even weeks trying to configuring things.
So, to get a gist of all the features Jarvim will provide you are listed below;

- Native Language-Server Protocol (LSP) support
- Custom Statusline & Tabline to provide useful info the way IDEs does
- Add file explorer support
- Enable version-control features

...and those were only a few to name. Do you feel there's a very useful IDE-like
feature missing out? Then open an Issue/Discussion thread for the community to
discuss about it. And then send over a PR with your additions.

**NOTE**: Jarvim is ever evolving & is probably subject to the needs of the
community. So, to get a detailed idea of what all features are included with
Jarvim, refer to the
["Available Features"](https://github.com/Jarmos-san/jarvim/wiki/Introducing-Jarvim!#available-features)
section of the wikia.

That said, any sort of contributions will be greatly appreciated. But before you
proceed ahead with contributing something, do take a thorough look at the
[**CONTRIBUTION**](./.github/CONTRIBUTING.md) guidelines.

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

## Consider Supporting Jarvim

Jarvim is a community-maintained project. Without the community effort the
project would have been nothing more than "just any other **personal** Neovim
configuration". Hence your support in whatever means will be quite helpful
towards maintaining the project.

You can support this project by:

1. Contributing by reporting issues, bugs & improvements.
2. Help maintain the project when necessary.
3. And/or send out a
   [Token of Appreciation](https://www.buymeacoffee.com/jarmos) with some
   :heart:

**NOTE**: Do refer to the [**CONTRIBUTING**](./.github/CONTRIBUTING.md)
guidelines before proceeding ahead with a PR.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/H2H567ZQH)

## License & Usage Terms & Conditions

All the source code developed in this project are licensed under the T&Cs of the
MIT license unless otherwise noted. So, you're free to copy & distribute it as
you wish but with due credit & acknowledgement. For more information, refer to
the [LICENSE](./LICENSE).
