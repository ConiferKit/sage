# Conifer API

Conifer runs a **local HTTP server** that speaks two protocols most tools
already understand:

- the **OpenAI** API (`/v1/*`), and
- the **Ollama-native** API (`/api/*`).

Point an existing client at the local address and it just works — no account, no
key, no data leaving the machine. This is how you build on top of Conifer
without touching the engine.

There are two ways to run the server:

1. **The desktop app** starts it for you when you enable "local server" (default
   `http://127.0.0.1:8080`).
2. **The CLI:** `conifer serve --model <model.gguf>` — see [cli.md](cli.md).

## Endpoints

### OpenAI-compatible (`/v1`)

| Method | Path | Purpose |
| --- | --- | --- |
| `POST` | `/v1/chat/completions` | Chat completion (streaming via SSE or buffered). The main endpoint. |
| `POST` | `/v1/completions` | Raw text completion. Supports a `suffix` for fill-in-the-middle. |
| `POST` | `/v1/embeddings` | Embedding vectors for one or more inputs. |
| `GET`  | `/v1/models` | List the loaded/available model(s). |
| `POST` | `/infill` | Fill-in-the-middle (code) completion. |

See [openai-compat.md](openai-compat.md) for request/response shapes and
examples.

### Ollama-native (`/api`)

For tools that auto-discover an Ollama backend (Cline, Roo, Zed, VS Code BYOK):

| Method | Path | Purpose |
| --- | --- | --- |
| `GET`  | `/api/tags` | List models (Ollama's model list). |
| `POST` | `/api/show` | Model details + `capabilities`. |
| `POST` | `/api/chat` | Chat (NDJSON streaming). |
| `POST` | `/api/generate` | Raw-prompt generation (NDJSON streaming). |
| `POST` | `/api/embed` | Embeddings. |

## Security model

The server binds to **loopback (`127.0.0.1`) by default** and has **no
authentication** — it assumes only processes on your machine reach it. It
rejects cross-origin browser requests. If you bind a non-loopback interface
(`--host 0.0.0.0`), you are deliberately exposing an unauthenticated engine to
your network; do that only behind your own trust boundary.

## Compatibility notes

- The `model` field in requests is accepted for client compatibility; the server
  serves whichever model is loaded. (In the desktop app you pick the model in the
  UI; with the CLI you pass `--model`.)
- Streaming chat uses **SSE** on `/v1/chat/completions` and **NDJSON** on the
  Ollama `/api/*` endpoints — matching each protocol's native framing.
