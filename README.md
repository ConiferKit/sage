<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/sage-banner-dark.png">
  <img src="assets/sage-banner-light.png" alt="Sage — a quiet operating system for local AI" width="100%">
</picture>

# Sage

Sage is designed around one idea: bringing performant AI to your machine and keeping it there.

It's a local inference engine we built from scratch in Rust - not another UI wrapper. The engine, the agent, and the tooling are all ours, tuned for your machine. This allows us to enforce security and data permissions instead of trusting a model's guardrails. One dependency keeps things simple and you can confidently source blame onto us if something breaks.

## What's inside
- Ecosystem not just a chatbot: Editor, integrated terminal, file viewers, IDE - the surfaces you actually build in.
- Security: All agents and tool calls run inside a kernel-level sandbox, so it can only touch what you allow. This isn't something a prompt or agent controls, its a boundary the OS holds for you.
- One click: We kept it simple, no docker, no servers to point at, no config files. Download the app, open it and its running.
- Nothing leaves your computer: No telemetry, no accounts, no cloud latency, no network downtime.
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

<sub>Built by Conifer Solutions.</sub>
