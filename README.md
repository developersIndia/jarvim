# Jarvim: A Sensible IDE-like Configured Environment for Neovim

![GitHub repo size](https://img.shields.io/github/repo-size/Jarmos-san/jarvim?label=Repo%20Size&logo=GitHub&style=flat-square) [![Sponsor](https://img.shields.io/badge/Sponsor-With%20a%20Coffee%2FBook-yellow)](https://www.buymeacoffee.com/jarmos) [![GitHub](https://img.shields.io/github/license/Jarmos-san/Jarvim?label=License&logo=GitHub&style=flat-square)](./LICENSE) ![Twitter Follow](https://img.shields.io/twitter/follow/Jarmosan?style=social)

![Jarvim's cover image](./assets/Jarvim.png)

**DISCLAIMER**: This project is a Work-in-Progress project & isn't ready to be
used yet! Please wait till the first Minor version is released. And even then
expect to come across a few breaking changes. If you come across any breaking
changes, feel free to open an [Issue thread](https://github.com/Jarmos-san/jarvim/issues/new/choose).

## About the Project

The goal of the project is to provide a sensible IDE-like experience on Neovim.
The project tries to stay as minimal as possible (_subjectively_) & mightn't
cater to everyone's tastes. If you need a "Vim-experience" right out-of-the-box
& without the need to spend hours trying configuring getting everything right,
Jarvim might as well be the right choice for you!

That said, following are the project goals & what does it try to achieve:

1. Require minimal configuration from the end-user's behalf, yet still provide
   an almost IDE-like behaviour within Neovim.
2. Be as fast as possible which means all the Neovim plugins have to be
   lazy-loaded whenever possible.
3. A "one-click solution" (_or rather one-liner command_) to get everything up &
   running.
4. Prioritise community engagement with detailed documentations for further
   expansion when/if needed at all.

## Installation Procedures

One of the primary goals of this project is to provide the end-user utilities to
get started with Neovim as quick as possible. Hence, we wrote an one-line code
snippet which should download & configure Neovim to work right away!

**On Windows PowerShell**

```powershell
(iwr "https://raw.githubusercontent.com/Jarmos-san/jarvim/dev/scripts/Get-Jarvim.ps1").content | iex 
```

**On Linux/MacOS**

```shell
curl -Ss https://raw.githubusercontent.com/Jarmos-san/jarvim/dev/scripts/installer.sh | bash
```

## TODO & Yet-To-Be Added Features

Following are some of the core features Jarvim will definitely have to become as
IDE-like as possible. While the list is non-exhaustive & feature requests are
welcome, arbitrary requests for features which aren't standard willn't be added.
So, if you feel I missed out some feature which is standard for any IDE out
there, feel free to open an Issue thread to discuss on it further.

- Native LSP configuration
- Customize the Statusline & Tabline to be more IDE-like
- Include plugins like
  [`surround.nvim`](https://github.com/blackCauldron7/surround.nvim).
  [`kommentary`](https://github.com/b3nj5m1n/kommentary) which makes it easier
  to comment blocks/lines of code with keybindings. Or surround them with
  characters like paranthesises.
- Add a file explorer.
- Enable VCS features using Git
- Cleanup devicon supports for all of the features mentioned above
- Provide detailed documentations for extending each & every feature mentioned
  above!

As you can see, Jarvim is supposed to be quite featureful & yet stay open to
further configurations & extensions. Applying every feature from this list takes
time & effort, so feel free to contribute to the project if possible.

Any sort of contributions will be greatly appreciated. But before you ahead with
contributing something, do take a thorough look at the
[**CONTRIBUTION**](./.github/CONTRIBUTING.md) guidelines.

## Credits & Acknowledgement

This project came to fuition due to inspiration from the following projects &
their respective maintainers:

- [LunarVim](https://github.com/LunarVim/LunarVim) maintained by [Christian
  Chiarulli](https://github.com/ChristianChiarulli)
- [disrupted/dotfiles](https://github.com/disrupted/dotfiles/tree/master/.config/nvim)
  maintained by [Salomon Popp](https://github.com/disrupted)

If you find Jarvim helpful, do note, it exists only on the shoulders of the
giants & because of their contributions. Do check out their projects &
considering supporting them through whatever means possible for you.

## Consider Supporting Jarvim

Jarvim is supposed to be a community-maintained project without which it's
nothing more than "just any other __personal__ Neovim configuration". Hence you
support in whatever means will be quite helpful towards maintaining the project.

You can support this project by:

1. Contributing by reporting issues, bugs & improvements.
2. Help maintain the project when necessary.
3. And/or send out a [Token of
   Appreciation](https://www.buymeacoffee.com/jarmos) with some :heart:

## License & Usage Terms & Conditions

All the source code developed in this project are licensed under the T&Cs of the
MIT license unless otherwise noted. So, you're free to copy & distribute it as
you wish but with due credit & acknowledgement. For more information, refer to
the [LICENSE](./LICENSE).
