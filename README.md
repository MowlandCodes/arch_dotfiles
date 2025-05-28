# Arch Linux Dotfiles Overview ✨

Welcome to my personal Arch Linux dotfiles repository! This collection is meticulously crafted to provide a streamlined, efficient, and aesthetically pleasing computing environment. It leverages various open-source tools and configurations to enhance productivity and user experience on an Arch Linux system.

## 🚀 Usage

This repository is designed to be easily deployed using **GNU Stow**. GNU Stow is a symlink farm manager that helps you manage installations of multi-file software packages, such as dotfiles, in a clean and organized way.

**Here's how to use it:**

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/mowlandcodes/arch_dotfiles.git ~/.dotfiles
    ```
2.  **Navigate into the cloned directory:**
    ```bash
    cd ~/.dotfiles
    ```
3.  **Stow the desired dotfiles.** For example, to apply the Neovim configurations:
    ```bash
    stow nvim
    ```
    Or to apply all dotfiles:
    ```bash
    stow bash gtk nvim ranger rofi suckless
    ```
    This will create symlinks from your home directory to the respective configuration files in this repository.

After stowing, it's recommended to run the `post-install.sh` script for additional setup steps like installing required packages.

## 📁 File Structure & Overview

This dotfiles repository is organized logically by application, making it easy to manage and understand.

### 🐧 `bash/`
Contains configurations related to the Bash shell.
-   `ble.sh/`: This directory appears to contain files related to `ble.sh`, a Bash Line Editor. It likely enhances the interactive command-line experience with features like rich syntax highlighting, auto-completion, and advanced keybindings. This sub-directory has its own internal structure including `lib/` (core functionalities), `contrib/` (contributions and integrations), `docs/` (documentation), and `memo/` (notes and benchmarks).
    -   Key files include `README.md` (for `ble.sh`), various `.sh` scripts in `lib/` for core functionalities (`core-cmdspec.sh`, `core-complete.sh`, `core-debug.sh`, `core-syntax.sh`, `init-bind.sh`, `init-cmap.sh`, `init-term.sh`, `keymap.emacs.sh`, `keymap.vi.sh`), and `make_command.sh` (likely for building or setting up `ble.sh`).
-   `bash/ble.sh/lib/*.sh`: These are core library scripts for `ble.sh`, handling command specification, completion, debugging, syntax highlighting, key bindings, terminal initialization, and different keymap modes (emacs, vi).
-   `bash/ble.sh/contrib/*.sh`: Scripts for integrations and additional features, such as `bash-preexec-def.sh` for pre-execution hooks.
-   `bash/ble.sh/memo/`: Contains various shell scripts for benchmarks, tests, and detailed notes on Bash behaviors and optimizations.
-   `bash/ble.sh/make/`: Scripts for building and generating various components, including character width tables for terminal display.

### 🎨 `gtk/`
-   `.config/gtk-3.0/settings.ini`: Manages GTK 3.0 application settings, such as themes, icons, and fonts, ensuring a consistent visual experience for GTK-based applications.

### ✍️ `nvim/`
Comprehensive Neovim configuration, providing a powerful and customizable text editing environment.
-   `init.lua`: The main entry point for Neovim configuration, written in Lua.
-   `lua/config/`: Contains general Neovim settings.
    -   `lazy_nvim.lua`: Configuration for `Lazy.nvim`, a popular plugin manager for Neovim.
    -   `snippets.lua`: Manages code snippets.
    -   `vim_settings.lua`: Core Vim/Neovim settings and options.
-   `lua/plugins/`: Directory for individual plugin configurations. Each Lua file in this directory configures a specific Neovim plugin, such as:
    -   `ai_integrations.lua`: Likely configures AI-related plugins (e.g., Copilot, ChatGPT integration).
    -   `autoclose.lua`: For auto-closing brackets and quotes.
    -   `colorizer.lua`: Adds color highlighting to color codes in files.
    -   `comment-nvim.lua`: For easy commenting and uncommenting code.
    -   `completions.lua`: Configures LSP and general completion plugins.
    -   `cs_catppuccin.lua`: Sets up the Catppuccin color scheme.
    -   `dashboard.lua`: Configures the startup dashboard.
    -   `image-nvim.lua`: For displaying images in Neovim.
    -   `indent_guides.lua`: Visual indentation guides.
    -   `laravel-nvim.lua`: Specific functionalities for Laravel development.
    -   `lazy_git.lua`: Integration with `lazygit` for Git operations.
    -   `lsp_configuration.lua`: Language Server Protocol (LSP) setup for various languages.
    -   `lualines.lua`: Configures the status line with `lualine.nvim`.
    -   `markdown_preview.lua`: Enables markdown preview.
    -   `neo_tree.lua`: File explorer configuration.
    -   `none_ls.lua`: Null-ls configuration for linting and formatting.
    -   `nvim_notify.lua`: Notification system.
    -   `nvim_telescope.lua`: Fuzzy finder setup.
    -   `nvim_treesitter.lua`: Syntax highlighting and parsing with Treesitter.
    -   `overseer.lua`: Task runner and build system integration.
    -   `tablines.lua`: Configuration for tab line.
    -   `vim-visual-multi.lua`: Multiple cursors support.
    -   `vim_surround.lua`: Surround plugin for quickly adding/changing surrounding characters.
    -   `which-key.lua`: Helps remember keybindings.
-   `after/queries/blade/`: Tree-sitter queries for Blade templates (Laravel), enabling proper highlighting and injections.

### 🌲 `ranger/`
Configurations for Ranger, a terminal file manager.
-   `.config/ranger/colorschemes/dracula.py`: Custom color scheme for Ranger.
-   `.config/ranger/plugins/ranger_devicons/`: A plugin to display file type icons (devicons) in Ranger.
    -   `__init__.py`, `devicons.py`: Python scripts implementing the devicons plugin.
-   `.config/ranger/scope.sh`: A shell script used by Ranger for previewing files.

### ⚙️ `rofi/`
Rofi configurations for a customizable application launcher and menu system.
-   `.config/rofi/applets/bin/`: Contains various shell scripts for Rofi applets, enabling quick access to system functions:
    -   `appasroot.sh`: Launch applications as root.
    -   `apps.sh`: General application launcher.
    -   `battery.sh`: Battery status.
    -   `brightness.sh`: Screen brightness control.
    -   `mpd.sh`: Music Player Daemon controls.
    -   `powermenu.sh`: Power management options (shutdown, reboot).
    -   `quicklinks.sh`: Quick access to defined URLs/commands.
    -   `screenshot.sh`: Screenshot utility.
    -   `volume.sh`: Volume control.
-   `.config/rofi/launchers/type-*/launcher.sh`: Different styles/types of Rofi launchers.
-   `.config/rofi/powermenu/type-*/powermenu.sh`: Different styles/types of Rofi power menus.

### 💻 `suckless/`
Configurations for Suckless utilities, known for their minimalism and efficiency.
-   `.dwm/autostart.sh`: Script to automatically start applications with DWM.
-   `suckless/dwm/`: Source code and configurations for DWM (Dynamic Window Manager).
    -   `config.def.h`, `config.h`: Header files for DWM configuration, defining keybindings, colors, layouts, and other settings. `config.h` is the user-modified version.
    -   `dwm.c`, `drw.c`, `util.c`: Core C source files for DWM's functionality, drawing, and utility functions.
    -   `patch/`: Contains various C source and header files for DWM patches, adding features like `alttab`, `aspectresize`, different bar styles (`bar_alpha`, `bar_awesomebar`, `bar_systray`), `cyclelayouts`, `fakefullscreenclient`, `ipc` communication, different layouts (`layout_bstack`, `layout_fibonacci`, `layout_grid`, `layout_monocle`), `pertag` settings, `scratchpad`, `seamless_restart`, `sticky`, `swallow`, `vanitygaps`, and more. These indicate a highly customized DWM setup.
    -   `patches.def.h`, `patches.h`: Define which patches are applied to DWM.
-   `suckless/dwmblocks/`: Source code and configurations for DWMBlocks, a simple status bar for DWM.
    -   `config.h`: Configuration for DWMBlocks, defining blocks and their update intervals.
    -   `src/`: C source files (`block.c`, `cli.c`, `main.c`, `signal-handler.c`, `status.c`, `timer.c`, `util.c`, `watcher.c`, `x11.c`) and `include/` header files for DWMBlocks functionality.
-   `suckless/st/`: Source code and configurations for ST (Simple Terminal).
    -   `config.def.h`, `config.h`: Header files for ST configuration, including fonts, colors, and keybindings.
    -   `st.c`, `x.c`, `hb.c`, `arg.h`, `st.h`, `win.h`: Core C source and header files for ST's functionality.
    -   `patches/`: Contains diff files for applying various patches to ST, such as `st-alpha` (transparency), `st-ligatures-alpha-scrollback` (font ligatures with scrollback), and `st-scrollback` (scrollback history).

### 📦 `post-install.sh`
A shell script designed to be run after stowing the dotfiles. It likely automates the installation of necessary packages and performs post-configuration steps to ensure the system is set up correctly with all dependencies.

## 🤝 Dependencies

This repository relies on several tools and programs to function correctly and provide the intended user experience. Key dependencies include:

-   **GNU Stow**: For managing and deploying the dotfiles via symlinks.
-   **Bash**: The primary shell environment.
-   **Neovim**: For advanced text editing.
    -   **Lazy.nvim**: Neovim plugin manager.
    -   **Tree-sitter**: For enhanced syntax highlighting and parsing.
    -   **Language Servers (LSP)**: For language-specific features (e.g., autocompletion, diagnostics).
    -   **Null-ls**: For linting and formatting.
    -   Various Neovim plugins (as indicated by the `lua/plugins/` directory).
-   **Ranger**: Terminal file manager.
    -   **ranger_devicons**: Ranger plugin for icons.
-   **Rofi**: Application launcher and menu system.
-   **Suckless Tools**:
    -   **DWM (Dynamic Window Manager)**: The window manager. Requires X.org.
    -   **DWMBlocks**: Status bar for DWM.
    -   **ST (Simple Terminal)**: The terminal emulator.
-   **GTK 3.0**: For consistent themeing of GTK applications.
-   **Core Utilities/Libraries (Linux)**: Standard Unix-like commands and libraries usually found on Arch Linux systems. C compilers (GCC) are needed for Suckless tools.

The `post-install.sh` script will likely handle the installation of most of these dependencies.

## 🌟 Features at a Glance

* **Custom Bash Environment**: Enhanced command-line experience with `ble.sh` for advanced editing and completion.
* **Minimalist Window Management**: Highly customized DWM setup with numerous patches for extended functionality and efficiency.
* **Powerful Text Editing**: Feature-rich Neovim configuration with LSP, Treesitter, and a wide array of plugins for various development workflows.
* **Efficient File Management**: Ranger with devicons for an intuitive terminal-based file Browse experience.
* **Quick Access & System Control**: Rofi applets and launchers for fast application launching, power management, and system status checks.
* **Unified Theming**: GTK settings for a consistent visual style across applications.
* **Lightweight Terminal**: ST terminal with ligatures, transparency, and scrollback.

## 🛡️ Badges

![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-brightgreen.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Built with love](https://img.shields.io/badge/Built%20with-Love-ff69b4.svg)
![Arch Linux](https://img.shields.io/badge/OS-Arch_Linux-1793D1?logo=arch-linux&logoColor=fff)
![Neovim](https://img.shields.io/badge/Editor-Neovim-57AD4C?logo=neovim&logoColor=fff)
![DWM](https://img.shields.io/badge/WM-DWM-F0C674?logo=x.org&logoColor=fff)
![Rofi](https://img.shields.io/badge/Launcher-Rofi-27B5D5?logo=rofi&logoColor=fff)
![Ranger](https://img.shields.io/badge/File_Manager-Ranger-F76C00?logo=file-explorer&logoColor=fff)

Feel free to explore, fork, and adapt these dotfiles to your needs! If you have any questions or suggestions, don't hesitate to reach out. Happy stowing! 🚀
