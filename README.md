<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/sage-banner-dark.png">
  <img src="assets/sage-banner-light.png" alt="Sage — a quiet operating system for local AI" width="100%">
</picture>

# Sage

**Performance for Local AI.**

Sage runs language models locally on your machine. We handle the annoying stuff (model setup, storage, memory, making it actually use your hardware right) so local AI just feels fast and reliable instead of broken. Everything runs on your device, no cloud, no telemetry, nothing leaving your machine.

---

## Download here!

| Platform | Get it | Details |
| --- | --- | --- |
| **macOS** · universal | **[Download&nbsp;.dmg](https://github.com/ConiferKit/sage/releases/latest/download/Sage_universal.dmg)** | Apple silicon + Intel · macOS 11+ · Metal |
| **Windows** · x86-64 | **[Download&nbsp;.exe](https://github.com/ConiferKit/sage/releases/latest/download/Sage_x64-setup.exe)** | Windows 10+ · Vulkan / CPU |
| **Linux** · x86-64 | **[Download&nbsp;.AppImage](https://github.com/ConiferKit/sage/releases/latest/download/Sage_amd64.AppImage)** | `.deb` also on the releases page |

Once installed, Sage will ship frequent updates. The app will checks for new releases on
launch, downloads them in the background, and offers a one-tap *Restart to apply*, so you don't have to re-download by hand.

### First launch

Sage is a new app, so your OS may show a one-time prompt before the first
open. 

- **macOS:** right-click (or Control-click) **Sage** → **Open** → **Open**. 
  
> If macOS will say it’s “damaged” (the build isn’t notarized yet); run this once in terminal: xattr -dr com.apple.quarantine /Applications/Sage.app

- **Windows:** if SmartScreen appears, click **More info → Run anyway**.

> It might give you a warning, again, click run anyway.

- **Linux:** mark the AppImage executable (`chmod +x Sage_amd64.AppImage`, or
  right-click → *Properties → Allow executing as program*) and run it.

---

## What you get

- **Local inference, in-process.** The model runs on your own CPU/GPU. Nothing
  leaves the machine.
- **Hardware-aware execution.** Metal on Apple silicon; Vulkan and CPU on
  Windows and Linux, with NVIDIA CUDA arriving automatically as a future update.
- **A real model manager.** Browse, download, quantize, and store models without
  hand-editing config.
- **Stays out of your way.** Dark, quiet, keyboard-driven. No account, no
  telemetry, no cloud.

## What's open

Sage is a **proprietary application**. The high-performance inference engine
and the agent runtime are Sage's core technology and ship **only as compiled
binaries** — there's no source here. This repository exists to **distribute the
app** and its release notes, nothing more.

## Links

- **Website:** [conifer.build](https://conifer.build)

## License

The Sage desktop application and its installers are **proprietary** — install
and use them freely; don't redistribute, reverse-engineer, or repackage them.
See [LICENSE](LICENSE).

<sub>Built by ConiferKit. Sage is a quiet operating system for local AI.</sub>
