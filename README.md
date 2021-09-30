# Jarvim: A Sensible IDE-like Configured Environment for Neovim

![GitHub repo size](https://img.shields.io/github/repo-size/Jarmos-san/jarvim?label=Repo%20Size&logo=GitHub&style=flat-square) [![Sponsor](https://img.shields.io/badge/Sponsor-With%20a%20Coffee%2FBook-yellow)](https://www.buymeacoffee.com/jarmos) [![GitHub](https://img.shields.io/github/license/Jarmos-san/Jarvim?label=License&logo=GitHub&style=flat-square)](./LICENSE) ![Twitter Follow](https://img.shields.io/twitter/follow/Jarmosan?style=social)

![Jarvim's cover image](./assets/Jarvim.png)

**DISCLAIMER**: This project is a Work-in-Progress project & isn't ready to be
used yet! Please wait till the first Minor version is released. And even then
expect to come across a few breaking changes. If you come across any breaking
changes, feel free to open an [Issue thread](https://github.com/Jarmos-san/jarvim/issues/new/choose).

## About the Project

If you've used Vim even briefly before, you would know, configuring the editor
to fit your development requirements is a serious undertaking. For some of us,
customizing our Vim experience is a never-ending process. Is that a productive
activity? I don't think so.

So, for the busy peeps out there, or even the lazy ones, Jarvim tries to resolve
a major problem for you. It tries to provide a sensible IDE-like experience at
the invocation of a single shell command!

So, if you're an experienced Vim user or perhaps you've just started dipping
your feet into Vim recently, then Jarvim a try. Who knows it might help you out
with not miss your old IDE & might end up liking Vim as well.

## Goals of the Project

If Jarvim piqued your interests by now, you should at least keep in mind what
the goals of Jarvim are. That said, following are the project goals & what does
it do to achieve those goals.

- **Provide an IDE-like Behaviour**: Jarvim aims to provide an IDE-like
  experience right out-of-the-box. You no longer have to spend hours (or even
  days) gettings things right. So, expect some core IDE-like features to just
  work.
- **Customizability**: Jarvim is nothing more than a stepping-stone for Neovim
  users to get started writing code with Neovim right away. It does impose any
  hard-coded behaviour. You're free to discard piece of code or add on top of it
  as you deem fit.
- **Extensibility**: Jarvim tries not to impose its opinion as much as possible.
  You, as the user, have the ultimate right to configure your Neovim experience
  as you like after using Jarvim.
- **Documentation**: Customizing & extending default behaviour isn't possible (or
  at least quite difficult) without having proper documentation in place. Hence,
  expect jarvim's source code to be heavily commented & documented where
  possible.
- **Minimalist Experience**: Subjectively speaking, Jarvim mightn't be minimal
  enough for some & that's fine. Jarvim adheres to provide a very minimal
  IDE-like experience within Neovim while still keeping in mind the above goals.

So, as you can Jarvim's goals mightn't cater to everyone. But if you're planning
to start using Neovim, Jarvim might just be the right place to start it with!

## Prerequisites & Good-t0-Know Info

While Jarvim aims to provide an IDE-like experience within Neovim at the
invocation of a shell command, it still requires some prerequisite dependencies
to work properly. Hence, this section lists all the caveats you need to be aware
of before using Jarvim.

TODO: List all the caveats & dependencies of the project.

## Installation Procedures

One of the primary goals of this project is to provide the end-user utilities to
get started with Neovim as quick as possible. Hence, we wrote an one-line code
snippet which should download & configure Neovim to work right away!

**On Windows PowerShell**

```powershell
(iwr "https://git.io/JgTXv").content | iex 
```

**On Linux/MacOS**

```shell
curl -Ss https://git.io/JgT65 | bash
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
