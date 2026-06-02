# OpenAI-compatible API

Base URL (default): `http://127.0.0.1:8080/v1`

Any OpenAI SDK works by overriding the base URL. The API key is ignored but most
clients require a non-empty value — use any string.

```bash
export OPENAI_BASE_URL=http://127.0.0.1:8080/v1
export OPENAI_API_KEY=local
```

---

## `POST /v1/chat/completions`

The primary endpoint. Streaming and non-streaming.

**Request**

```json
{
  "model": "conifer",
  "messages": [
    { "role": "system", "content": "You are concise." },
    { "role": "user", "content": "What is bandwidth-bound decoding?" }
  ],
  "temperature": 0.7,
  "max_tokens": 512,
  "stream": false
}
```

**Response (non-streaming)**

```json
{
  "id": "chatcmpl-…",
  "object": "chat.completion",
  "choices": [
    {
      "index": 0,
      "message": { "role": "assistant", "content": "…" },
      "finish_reason": "stop"
    }
  ],
  "usage": { "prompt_tokens": 21, "completion_tokens": 88, "total_tokens": 109 }
}
```

**Streaming** (`"stream": true`) emits Server-Sent Events: `data: {…}` chunks
of `chat.completion.chunk` objects, terminated by `data: [DONE]`.

**Tool calling** is supported via the standard OpenAI `tools` / `tool_choice`
fields; the server constrains generation so the model emits well-formed tool
calls.

### cURL

```bash
curl http://127.0.0.1:8080/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{"model":"conifer","messages":[{"role":"user","content":"hi"}]}'
```

### Python (openai SDK)

```python
from openai import OpenAI
client = OpenAI(base_url="http://127.0.0.1:8080/v1", api_key="local")
for chunk in client.chat.completions.create(
    model="conifer",
    messages=[{"role": "user", "content": "Stream a haiku about Metal."}],
    stream=True,
):
    print(chunk.choices[0].delta.content or "", end="")
```

### JavaScript / TypeScript

```ts
import OpenAI from "openai";
const client = new OpenAI({ baseURL: "http://127.0.0.1:8080/v1", apiKey: "local" });
const r = await client.chat.completions.create({
  model: "conifer",
  messages: [{ role: "user", content: "Hello" }],
});
console.log(r.choices[0].message.content);
```

---

## `POST /v1/completions`

Raw text completion (no chat template). Pass `suffix` to do fill-in-the-middle.

```json
{ "model": "conifer", "prompt": "def fib(n):\n    ", "suffix": "\n    return out", "max_tokens": 128 }
```

## `POST /v1/embeddings`

```json
{ "model": "conifer", "input": ["first text", "second text"] }
```

Returns `data[].embedding` vectors in the OpenAI shape.

## `POST /infill`

Fill-in-the-middle for code completion. Send the code before and after the
cursor; the server returns the middle. (The same capability is reachable via
`/v1/completions` with a `suffix`.)

## `GET /v1/models`

Lists the served model so discovery-based clients (editors, agents) can populate
their model pickers.

---

## Using Conifer from common tools

- **VS Code (BYOK / Continue / Cline / Roo):** set the OpenAI base URL to
  `http://127.0.0.1:8080/v1`, or let Ollama-style auto-discovery find the
  `/api/*` surface. Any string works as the API key.
- **Zed:** add an OpenAI-compatible provider pointing at the base URL above.
- **Your own app:** use any OpenAI SDK with the base URL overridden, as shown
  above.

See [README.md](README.md) for the Ollama-native `/api/*` surface and the
security model.
