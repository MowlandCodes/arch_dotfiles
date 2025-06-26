# 💀 Mowland's Arch Linux Dotfiles 💀

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OS: Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-blue.svg?style=flat-square&logo=arch-linux)](https://archlinux.org/)
_Seriously, another dotfiles repo?_ Yes, tapi yang ini diracik khusus buat lu yang ngerti kalo _less is more_, dan nge-klik mouse itu buang-buang waktu. Ini bukan sekadar kumpulan file konfigurasi, ini adalah _blueprint_ buat ngerakit _battle station_ lu di Arch Linux, langsung siap tempur dari nol.

Analogi buat anak server: Anggep aja repo ini kayak _Ansible playbook_ atau _Docker image_ buat _desktop environment_ lu. _Pull_, _run the script_, dan _boom!_ infrastruktur desktop lu langsung _up and running_. Gak perlu lagi setup satu-satu kayak anak magang baru belajar `apt-get install`.

---

### 🎨 Showcase

**(Woy, Taro Screenshot Keren Setup Lu di Sini Biar Keliatan Pro!)**

| Tampilan Bersih (Clean) | Tampilan Sibuk (Dirty/Busy) |
| :---------------------: | :-------------------------: |
|     _(Image clean)_     |       _(Image busy)_        |

---

### ✨ Fitur Utama & Teknologi yang Dipake

Ini bukan setup kaleng-kaleng. Semua komponen dipilih biar ringan, cepet, dan bisa di-oprek sampe ke akar-akarnya.

- **Window Manager:** **[suckless DWM](https://dwm.suckless.org/)** yang udah di-steroid pake _patch_ `vanitygaps`, `autostart`, `systray`, dan kawan-kawannya. Lupakan konsep _desktop icons_.
- **Terminal Emulator:** **[suckless ST](https://st.suckless.org/)** dengan dukungan transparansi (`alpha`) dan _font ligatures_. Cuma nampilin yang lu butuhin, gak lebih.
- **Status Bar:** **[dwmblocks](https://github.com/torrinfail/dwmblocks)** buat nampilin status sistem tanpa bikin bar lu keliatan norak. _Simple and effective_.
- **Application Launcher:** **[Rofi](https://github.com/davatorium/rofi)**, karena `dmenu` terlalu _vanilla_ buat sebagian orang.
- **Text Editor:** **[Neovim](https://neovim.io/)** yang udah di-setting jadi IDE modern pake Lua. Ada LSP, _autocompletion_, _fuzzy finding_ dengan Telescope, dan pastinya tema Catppuccin biar _coding_ gak ngerusak mata.
- **Shell Prompt:** **[Starship](https://starship.rs/)**, biar terminal lu bisa ngasih info penting tanpa perlu lu tanya.
- **Compositor:** **[Picom](https://github.com/yshui/picom)** buat efek-efek visual kayak _blur_ dan _rounded corners_. Biar minimalis tapi tetep _fancy_.
- **File Manager:** **[Ranger](https://github.com/ranger/ranger)**, file manager di terminal dengan _vim-bindings_.
- **Multiplexer Terminal:** **[Tmux](https://github.com/tmux/tmux/wiki)**, biar sesi SSH dan kerjaan di server lu tetep aman walaupun koneksi putus-nyambung kayak hubunganmu sama dia.

---

### 警告: Peringatan Keras!

Repo ini dan skrip di dalamnya dibuat dengan asumsi lu tau apa yang lu lakuin. Skrip ini bakal nginstall paket, ngubah file sistem, dan nge-compile program.

**BACKUP DATA PENTING LU DULU!**

Gua gak tanggung jawab kalo laptop lu jadi _brick_, data skripsi lu ilang, atau tiba-tiba jadi server `csgo`. _You run it, you own the consequences_. _Don't be a script kiddie, read the script first_.

---

### 🚀 Instalasi

Proses instalasi dibagi jadi 3 tahap. Dijalankan secara berurutan. Pastikan lu udah di _base install_ Arch Linux yang fresh.

**1. Clone Repositori Ini**

Jelas lah ya, gimana mau install kalo gak di-clone dulu? Buka terminal lu yang masih polosan itu.

```bash
    git clone https://github.com/mowlandcodes/arch_dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
```

**2. Kasih Izin Eksekusi ke Skripnya**

Skripnya gak akan jalan kalo gak lu kasih restu.

```bash
    chmod +x stage-1.sh stage-2.sh stage-3.sh
```

**3. Tahap 1: Persiapan Awal & Driver**

Skrip ini bakal ngurusin perihal instalasi **_AUR Helper_** dan package-package yang dibutuhin buat _environment_ ini.

```bash
    ./stage-1.sh
```

**PENTING:** Setelah tahap ini selesai, **REBOOT** sistem lu. Ini wajib biar driver dan modul kernel yang baru bisa ke-load. Jangan ngeyel.

**4. Tahap 2: Instalasi Aplikasi Utama & Dotfiles**

Setelah reboot, login lagi, masuk ke direktori `~/.dotfiles`, dan lanjut ke tahap dua. Skrip ini bakal nginstall semua aplikasi tambahan buat _environment_ ini dan nyalin file-file konfigurasi (dotfiles) ke tempatnya.

```bash
    ./stage-2.sh
```

**5. Tahap 3: Kompilasi & Finalisasi**

Disini lu harus **Run as Root**, karena stage-3 ini buat nge Finalisasi setup _environment_ ini.

```bash
    sudo ./stage-3.sh
```

Setelah selesai, Lu akan ditanya untuk **REBOOT** sekali lagi, jika lu jawab iya lu bisa langsung **_REBOOT_** buat mastiin semuanya berjalan mulus. Harusnya setelah ini lu udah bisa login ke DWM. _Welcome to the rice fields_.

---

### ⌨️ Keybindings Penting

Ngapain pake DWM kalo masih pake mouse? Ini beberapa contekan biar gak keliatan kayak amatir. (`Mod` key di-setting sebagai `Super/Windows key`).

#### DWM (Window Manager)

| Shortcut                          | Aksi                          |
| :-------------------------------- | :---------------------------- |
| `Mod + Return`                    | Buka Terminal Baru (`st`)     |
| `Alt + Space`                     | Buka App Launcher (`rofi`)    |
| `Mod + Shift + c`                 | Tutup window yang lagi fokus  |
| `Mod + PageUp` / `Mod + PageDown` | Pindah fokus ke window lain   |
| `Mod + h` / `Mod + l`             | Ubah ukuran window master     |
| `Mod + t`                         | Ganti ke tiling mode          |
| `Mod + f`                         | Ganti ke floating mode        |
| `Mod + m`                         | Ganti ke monocle mode         |
| `Mod + Left / Right`              | Pindah ke tag sebelum/sesudah |
| `Mod + Shift + q`                 | Keluar dari DWM (logout)      |
| `Mod + CTRL + Shift + q`          | Keluar dari DWM (logout)      |

#### Neovim

Keybindings Neovim lu udah kayak cockpit pesawat, banyak banget. Tapi intinya, `Leader` key-nya adalah `Space`.

- **`Space + f f`**: Cari file di project (Telescope)
- **`Space + l g`**: Cari kata di semua file (Live Grep)
- ... dan masih banyak lagi. Cek aja file `lua/plugins/nvim_telescope.lua` dan `lua/config/vim_settings.lua` buat info lebih lengkap.

---

### License

Seperti biasa, pake lisensi **MIT**. Artinya, bebas mau lu apain aja, tapi kalo ada apa-apa jangan nyalahin gua.

```
    MIT License

    Copyright (c) 2025 Mowland

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
```

---
