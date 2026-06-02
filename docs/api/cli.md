# `conifer serve` — the CLI server

The desktop app starts the local server for you. For headless machines, scripts,
or remote dev boxes, the `conifer` CLI runs the same OpenAI-compatible server
directly.

```bash
conifer serve --model /path/to/model.gguf
# conifer serve: model "…" on http://127.0.0.1:8080/v1 — press Ctrl-C to stop
```

## Flags

| Flag | Default | Meaning |
| --- | --- | --- |
| `--model <path.gguf>` | *(required)* | The GGUF weights to load and serve. |
| `--port <N>` | `8080` | TCP port to listen on. |
| `--host <iface>` | `127.0.0.1` | Interface to bind. **Loopback by default.** |
| `--backend <B>` | auto | Execution backend (e.g. `metal`, `vulkan`, `cpu`) where applicable to the platform. |

## Security

The server has **no authentication**. Binding loopback (`127.0.0.1`) keeps it
reachable only from your own machine. Set `--host 0.0.0.0` *only* when you
intend to expose it on your network and have your own access controls in front
of it — otherwise you are publishing an unauthenticated inference endpoint.

## Endpoints

Identical to the desktop server — see [README.md](README.md) and
[openai-compat.md](openai-compat.md). In short:

```bash
# OpenAI
curl http://127.0.0.1:8080/v1/chat/completions -d '{"model":"conifer","messages":[{"role":"user","content":"hi"}]}'
curl http://127.0.0.1:8080/v1/models

# Ollama-native (for editor auto-discovery)
curl http://127.0.0.1:8080/api/tags
```

## Example: use it as your coding agent's backend

```bash
# Terminal 1 — start the server
conifer serve --model ~/models/qwen2.5-coder-7b-q4_k.gguf --port 8080

# Terminal 2 — point a tool at it
export OPENAI_BASE_URL=http://127.0.0.1:8080/v1
export OPENAI_API_KEY=local
# …run your agent / editor extension…
```
