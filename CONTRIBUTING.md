# Contributing to Conifer

Conifer's inference engine and agent runtime are closed source — they're the
core technology. So "contributing" here doesn't mean sending engine patches. It
means the things that genuinely help and that this public repository can hold:

## Ways to contribute

- **Report bugs.** [Open an issue](https://github.com/ConiferKit/sage/issues)
  with your OS, Conifer version (Settings → About), the model, and steps to
  reproduce. Crash logs and a short repro are worth a thousand words.
- **Improve the docs.** The API reference in [`docs/api/`](docs/api/) and this
  repository's prose are [MIT](LICENSE)-licensed — PRs that fix, clarify, or
  extend them are welcome.
- **Build integrations.** Conifer speaks the OpenAI and Ollama HTTP APIs. If you
  wire it into an editor, agent, or tool, tell us — we'll link good ones.
- **Share examples.** A clean snippet that drives `conifer serve` from a new
  language or framework is a great PR to `docs/api/`.

## What we can't take

- Patches to the engine, kernels, or agent runtime (not in this repo).
- Repackaged or re-hosted builds (see the [EULA](LICENSE)).

## Ground rules

- One change per PR; keep it focused.
- Match the surrounding tone: plain, technical, no hype. (Conifer's voice is a
  quiet operating system — sentence case, concrete nouns, no marketing.)
- Be respectful. We follow the standard
  [Contributor Covenant](https://www.contributor-covenant.org/) norms.

## Security issues

Do **not** open a public issue for a vulnerability — see
[SECURITY.md](SECURITY.md) for private disclosure.
