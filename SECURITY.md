# Security

Conifer runs models locally and updates itself. Two things matter for security:
the **update channel** and the **local server**. Here's how both are designed,
and how to report a problem.

## Reporting a vulnerability

Please report privately — do **not** open a public issue.

- **Preferred:** [GitHub private security advisory](https://github.com/ConiferKit/sage/security/advisories/new)
- **Email:** contact@conifer.build

Include the Conifer version (Settings → About), your OS, and a reproduction.
We'll acknowledge within a few business days and keep you posted through the fix.
Please give us reasonable time to ship a fix before any public disclosure.

## The update channel

Conifer's auto-updates are **cryptographically signed**. Each release artifact is
signed with a minisign private key held only in CI; the matching public key is
compiled into the app. The updater **refuses any update whose signature doesn't
verify**, so a compromised mirror or a man-in-the-middle can't push a malicious
build to installed apps. Updates download in the background and apply only on a
restart you initiate.

## The local server

When you enable the OpenAI-compatible server (in the app or via `conifer serve`):

- It binds to **loopback (`127.0.0.1`) by default** and has **no
  authentication** — it assumes only processes on your machine reach it.
- It **rejects cross-origin browser requests**, so a web page you visit can't
  drive your local engine.
- Binding a non-loopback interface (`--host 0.0.0.0`) deliberately exposes an
  unauthenticated inference endpoint to your network. Only do that behind your
  own access controls.

See [`docs/api/`](docs/api/) for the full surface and security notes.

## Privacy posture

The engine runs in-process. Inference does not send your prompts or data to any
server. The only network traffic Conifer initiates is: checking the update feed,
and downloading models **you** choose to install.

## Scope

This policy covers the Conifer desktop application and the contents of this
repository. The engine and agent-runtime source are not public; report issues
you observe in the shipped app through the channels above.
