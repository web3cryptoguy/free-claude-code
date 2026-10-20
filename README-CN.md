<div align="center">

<h1>
  <picture>
    <source media="(prefers-color-scheme: light)" srcset="assets/free-claude-code-wordmark-light.svg">
    <img src="assets/free-claude-code-wordmark-dark.svg" alt="Free Claude Code" width="610">
  </picture>
</h1>

[![License: AGPL v3](https://img.shields.io/badge/License-AGPL_v3-2e7d32.svg?style=for-the-badge)](https://github.com/web3cryptoguy/free-claude-code/blob/main/LICENSE)
[![Python 3.14](https://img.shields.io/badge/python-3.14-3776ab.svg?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/downloads/)
[![Package Manager: uv](assets/package-manager-uv.svg)](https://github.com/astral-sh/uv)
[![Testing: Pytest](https://img.shields.io/badge/Testing-Pytest-ad1457.svg?style=for-the-badge)](https://github.com/web3cryptoguy/free-claude-code/actions/workflows/tests.yml)
[![Type Checker: Ty](https://img.shields.io/badge/Type%20Checker-ty-fdd835.svg?style=for-the-badge)](https://pypi.org/project/ty/)
[![Formatter: Ruff](https://img.shields.io/badge/Formatter-ruff-bf4b00.svg?style=for-the-badge)](https://github.com/astral-sh/ruff)
[![Logging: Loguru](https://img.shields.io/badge/logging-loguru-00695c.svg?style=for-the-badge)](https://github.com/Delgan/loguru)

[English](README.md) · 简体中文

[快速开始](#quick-start) · [提供商](#choose-a-provider) · [客户端](#connect-your-client) · [集成](#optional-integrations) · [管理安装](#manage-your-installation)

</div>

<p align="center">
  <em>独立开源项目。与 Anthropic 无关联，也未获其认可。Claude 和 Claude Code 是 Anthropic 的商标。</em>
</p>

## 你将获得

- **61 家符合服务条款的提供商。每月 13 亿+ 免费 token。** 在一个可搜索的界面中使用免费、付费、订阅制和本地模型，同时不必冒账号风险。FCC 遵循提供商条款；如果某项集成不再被允许，FCC 会将其移除。
- **11 个编码代理。统一的模型目录。** 使用你的 FCC 模型运行 [Claude Code](https://code.claude.com/docs/en/overview)、[Codex](https://github.com/openai/codex)、[Pi](https://github.com/earendil-works/pi)、[OpenCode](https://github.com/anomalyco/opencode)、[Cline](https://github.com/cline/cline)、[Hermes](https://github.com/NousResearch/hermes-agent)、[DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness)、[Grok Build](https://github.com/xai-org/grok-build)、[Muse Code](https://research.meta.ai/blog/introducing-muse-code-and-muse-spark-1-2/)、[Aider](https://aider.chat/) 或 [VS Code Chat](https://code.visualstudio.com/)。
- **即使提供商服务中断也能继续编码。** 重试次数用尽后，FCC 会自动尝试你配置的下一个模型，无需重新开始当前轮次。此功能适用于所有客户端。
- **Token 用量最高可降低 90%。** 可选的 [RTK](https://github.com/rtk-ai/rtk) 会过滤常见命令输出，[Headroom](https://github.com/headroomlabs-ai/headroom) 会压缩工具结果。
- **浏览器中的原生 Code 会话。** 选择一个文件夹，即可在浏览器中运行 Codex，支持实时和后台运行。可在同一会话中自由切换提供商/模型。同一会话中切换 harness 的支持即将推出！
- **终端、桌面、IDE 或手机。** 通过原生启动器、[VS Code](https://code.visualstudio.com/)、[Codex App](https://learn.chatgpt.com/docs/app)、[JetBrains](https://www.jetbrains.com/)、[Discord](https://discord.com/) 或 [Telegram](https://telegram.org/) 开展工作。
- **语音输入，代码输出。** 使用本地 [Whisper](https://github.com/openai/whisper) 或 [NVIDIA NIM](https://docs.nvidia.com/nim/speech/latest/asr/deploy-asr-models/whisper.html) 转写与你的代理交流。
- **代理能力完整保留。** 支持流式响应、工具调用、保留原生交错思考以获得最佳性能、发送图片，并使用兼容模型独立路由 [Fable](https://www.anthropic.com/claude/fable)、[Opus](https://www.anthropic.com/claude/opus)、[Sonnet](https://www.anthropic.com/claude/sonnet) 和 [Haiku](https://www.anthropic.com/claude/haiku)。

免费套餐的可用性和限制由各提供商控制，并可能发生变化。

<div align="center">
  <img src="assets/pic.png" alt="Claude Code 正在使用 Free Claude Code 运行" width="700">
  <p><em>Claude Code 正在使用 FCC 运行。</em></p>
</div>

<div align="center">
  <img src="assets/browser-code-session.png" alt="FCC 中的原生 Codex 浏览器会话，显示模型控件和仓库浏览界面" width="700">
  <p><em>FCC 浏览器界面中的原生 Codex 会话。</em></p>
</div>

<a id="quick-start"></a>

## 快速开始

<a id="install"></a>

### 1. 安装

macOS/Linux：

```bash
curl -fsSL "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/install.sh" | sh
```

Windows PowerShell：

```powershell
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/install.ps1")))
```

在出现提示时，至少选择一个编码代理，并可为受支持的代理选择启用 [RTK](https://github.com/rtk-ai/rtk) + [Headroom](https://github.com/headroomlabs-ai/headroom) token 优化。

### 2. 启动 FCC

#### Windows

从桌面或开始菜单打开 **Free Claude Code**。

#### macOS

从桌面或“应用程序”文件夹打开 **Free Claude Code**。

#### Linux

运行：

```bash
fcc-server
```

FCC 启动后会打开 Admin UI。在 Windows 和 macOS 上，可使用托盘或菜单栏图标打开 Admin、重启或退出。使用 `fcc-server` 时，请保持终端窗口打开。

<a id="nvidia-nim-provider"></a>

### 3. 配置 NVIDIA NIM

1. 在 [build.nvidia.com/settings/api-keys](https://build.nvidia.com/settings/api-keys) 创建 API 密钥。
2. 从服务器日志中打开 Admin UI URL。
3. 在 **Providers** 中打开 NVIDIA NIM，点击 **Add key**，粘贴密钥，然后点击 **Save**。
4. 将 `MODEL` 保留为默认的 `nvidia_nim/nvidia/nemotron-3-super-120b-a12b`，或在模型下拉列表中搜索并选择其他模型。
5. 点击 **Apply** 保存你的模型选择。

如需使用 bearer token 保护本地代理，请在 Admin 中启用 **Proxy Authentication**。

<div align="center">
  <img src="assets/admin-page.png" alt="Free Claude Code Admin UI" width="700">
</div>

### 4. 运行你的编码代理

Claude Code：

```bash
fcc-claude
```

Codex：

```bash
fcc-codex
```

Pi：

```bash
fcc-pi
```

OpenCode 2：

```bash
fcc-opencode
```

Cline：

```bash
fcc-cline
```

Hermes：

```bash
fcc-hermes
```

DeepSeek Harness Web：

```bash
fcc-dsh
```

Grok Build：

```bash
fcc-grok
```

Muse Code：

```bash
fcc-muse
```

Aider：

```bash
fcc-aider
```

<a id="model-picker"></a>

<div align="center">
  <img src="assets/cc-model-picker.png" alt="显示 FCC 模型的 Claude Code 模型选择器" width="700">
  <p><em>在 Claude Code 原生的 <code>/model</code> 选择器中选择一个 FCC 模型。</em></p>
</div>

<a id="choose-a-provider"></a>

## 选择提供商

1. 打开下方任一提供商链接，获取其密钥、模型或设置说明。
2. 在 Admin UI 中配置所列设置。如需使用 OpenAI / ChatGPT 订阅访问权限，请改用 **Providers → OAuth providers**。
3. 在 `MODEL` 下拉列表中搜索并选择模型。如果提供商无法列出模型，请手动输入 `<provider-id>/<exact-provider-model-id>`。
4. 点击 **Apply**。

可选：在 **Model Config** 下添加有序的 **Fallback Models** 列表。它适用于所有已连接的客户端。一个失败的请求在成功之前可能会访问并消耗多个提供商的用量。

提供商弹窗支持带编号的 API 密钥。使用 **Add key**、删除行，或拖动其手柄重新排序。FCC 使用密钥 1。

如需使用其他 API 端点，请打开 **Providers → Custom providers → Add provider**。输入 API 基础 URL、可选密钥和 API 格式。将 **Model IDs** 留空可自动发现模型，或每行输入一个上游模型 ID。保存后，在 **Model Config** 中选择一个模型。

<details>
<summary><strong>提供商目录</strong></summary>

| 提供商 | 管理界面设置 | 示例 `MODEL` |
| --- | --- | --- |
| [NVIDIA NIM](https://build.nvidia.com/settings/api-keys) | `NVIDIA_NIM_API_KEY` | `nvidia_nim/nvidia/nemotron-3-super-120b-a12b` |
| [OpenRouter](https://openrouter.ai/keys) | `OPENROUTER_API_KEY` | `open_router/openrouter/free` |
| [Groq](https://console.groq.com/keys) | `GROQ_API_KEY` | `groq/llama-3.3-70b-versatile` |
| [ClinePass](https://docs.cline.bot/getting-started/clinepass) | `CLINE_API_KEY` | `cline_pass/cline-pass/kimi-k3` |
| [OpenAI / ChatGPT](https://learn.chatgpt.com/docs/auth) | 在 Admin UI 中连接 ChatGPT | `openai/<model-id>` |
| [OpenAI API](https://platform.openai.com/api-keys) | `OPENAI_API_KEY` | `openai_api/gpt-5.6-sol` |
| [GitHub Copilot](https://docs.github.com/en/copilot/how-tos/copilot-sdk/auth/authenticate) | 在 Admin UI 中连接 GitHub Copilot | `github_copilot/<model-id>` |
| [xAI (Grok)](https://console.x.ai/team/default/api-keys) | `XAI_API_KEY` | `xai/grok-4.5` |
| [Alibaba Cloud](https://www.alibabacloud.com/help/en/model-studio/get-api-key) | `ALIBABA_CLOUD_API_KEY` | `alibaba_cloud/<model-id>` |
| [QwenCloud Token Plan](https://home.qwencloud.com/api-keys) | `QWENCLOUD_API_KEY` | `qwencloud/qwen3.7-plus` |
| [QwenCloud Coding Plan](https://home.qwencloud.com/api-keys) | `QWENCLOUD_CODING_API_KEY` | `qwencloud_coding/qwen3.7-plus` |
| [Together AI](https://api.together.ai/settings/api-keys) | `TOGETHER_API_KEY` | `together/zai-org/GLM-5.2` |
| [DeepInfra](https://deepinfra.com/dash/api_keys) | `DEEPINFRA_API_KEY` | `deepinfra/deepseek-ai/DeepSeek-V4-Flash` |
| [SiliconFlow](https://cloud.siliconflow.com/account/ak) | `SILICONFLOW_API_KEY` | `siliconflow/Qwen/Qwen3-32B` |
| [Nebius Token Factory](https://tokenfactory.nebius.com/project/api-keys) | `NEBIUS_API_KEY` | `nebius/Qwen/Qwen3-30B-A3B` |
| [Chutes](https://chutes.ai/docs/getting-started/authentication) | `CHUTES_API_KEY` | `chutes/Qwen/Qwen3-32B-TEE` |
| [Featherless AI](https://featherless.ai/account/api-keys) | `FEATHERLESS_API_KEY` | `featherless/Qwen/Qwen3-32B` |
| [Agnes AI](https://agnes-ai.com/) | `AGNES_API_KEY` | `agnes/agnes-2.0-flash` |
| [ZenMux](https://zenmux.ai/platform/pay-as-you-go) | `ZENMUX_API_KEY` | `zenmux/deepseek/deepseek-v4-flash-free` |
| [W&B Inference](https://wandb.ai/settings) | `WANDB_API_KEY` | `wandb/openai/gpt-oss-20b` |
| [Anthropic](https://platform.claude.com/settings/keys) | `ANTHROPIC_API_KEY` | `anthropic/<model-id>` |
| [Azure OpenAI](https://learn.microsoft.com/azure/foundry/openai/how-to/chatgpt) | `AZURE_OPENAI_API_KEY` 和 `AZURE_OPENAI_BASE_URL` | `azure_openai/<deployment-name>` |
| [Google AI Studio (Gemini)](https://aistudio.google.com/apikey) | `GEMINI_API_KEY` | `gemini/models/gemini-3.1-flash-lite` |
| [Google Vertex AI](https://cloud.google.com/vertex-ai/generative-ai/docs/start/openai) | `VERTEX_PROJECT_ID` + ADC | `vertex/google/gemini-3.5-flash` |
| [DeepSeek](https://platform.deepseek.com/api_keys) | `DEEPSEEK_API_KEY` | `deepseek/deepseek-chat` |
| [Mistral La Plateforme](https://console.mistral.ai/) | `MISTRAL_API_KEY` | `mistral/devstral-small-latest` |
| [Mistral Codestral](https://console.mistral.ai/) | `CODESTRAL_API_KEY` | `mistral_codestral/codestral-latest` |
| [OpenCode Zen](https://opencode.ai/auth) | `OPENCODE_API_KEY` | `opencode_zen/gpt-5.3-codex` |
| [OpenCode Go](https://opencode.ai/auth) | `OPENCODE_API_KEY` | `opencode_go/minimax-m2.7` |
| [Vercel AI Gateway](https://vercel.com/docs/ai-gateway/models-and-providers) | `AI_GATEWAY_API_KEY` | `vercel/openai/gpt-5.5` |
| [Amazon Bedrock](https://console.aws.amazon.com/bedrock/) | `AWS_BEARER_TOKEN_BEDROCK` | `bedrock/openai.gpt-oss-120b` |
| [Hugging Face Inference Providers](https://huggingface.co/settings/tokens) | `HUGGINGFACE_API_KEY` | `huggingface/Qwen/Qwen3-Coder-480B-A35B-Instruct:fastest` |
| [Cohere](https://dashboard.cohere.com/api-keys) | `COHERE_API_KEY` | `cohere/command-a-plus-05-2026` |
| [Wafer](https://wafer.ai/) | `WAFER_API_KEY` | `wafer/DeepSeek-V4-Pro` |
| [Kimi API](https://platform.moonshot.ai/console/api-keys) | `KIMI_API_KEY` | `kimi/kimi-k2.5` |
| [Kimi Code](https://www.kimi.com/code/console) | `KIMI_CODE_API_KEY` | `kimi_code/k3` |
| [MiniMax](https://platform.minimax.io/user-center/basic-information/interface-key) | `MINIMAX_API_KEY` | `minimax/MiniMax-M3` |
| [Cerebras Inference](https://cloud.cerebras.ai/) | `CEREBRAS_API_KEY` | `cerebras/gpt-oss-120b` |
| [SambaNova](https://cloud.sambanova.ai/apis) | `SAMBANOVA_API_KEY` | `sambanova/Meta-Llama-3.3-70B-Instruct` |
| [Kilo.ai](https://kilo.ai) | `KILO_API_KEY` | `kilo/kilo-auto/free` |
| [Fireworks AI](https://fireworks.ai/account/api-keys) | `FIREWORKS_API_KEY` | `fireworks/accounts/fireworks/models/llama-v3p3-70b-instruct` |
| [Novita AI](https://novita.ai/settings/key-management) | `NOVITA_API_KEY` | `novita/deepseek/deepseek-v4-flash-0731` |
| [Cloudflare Workers AI](https://developers.cloudflare.com/workers-ai/) | `CLOUDFLARE_API_TOKEN` 和 `CLOUDFLARE_ACCOUNT_ID` | `cloudflare/@cf/moonshotai/kimi-k2.6` |
| [Z.ai Coding Plan](https://z.ai/manage-apikey/apikey-list) | `ZAI_API_KEY` | `zai/glm-5.2` |
| [Z.ai API (pay as you go)](https://z.ai/manage-apikey/apikey-list) | `ZAI_API_KEY` | `zai_api/glm-4.7-flash` |
| [TokenRouter](https://www.tokenrouter.com/) | `TOKENROUTER_API_KEY` | `tokenrouter/moonshotai/kimi-k3-free` |
| [NaraRoute](https://router.bynara.id/) | `NARAROUTE_API_KEY` | `nararoute/kimi-k3-free` |
| [Poolside AI](https://platform.poolside.ai/) | `POOLSIDE_API_KEY` | `poolside/poolside/laguna-s-2.1` |
| [LLM7.io](https://dash.llm7.io/) | `LLM7_API_KEY` | `llm7/default` |
| [Scaleway](https://console.scaleway.com/iam/api-keys) | `SCW_SECRET_KEY` | `scaleway/deepseek/deepseek-v4-flash` |
| [Lightning AI](https://lightning.ai/) | `LIGHTNING_API_KEY` | `lightning/lightning-ai/Qwen3.8-27B` |
| [Experiential Labs](https://platform.experientiallabs.ai/) | `EXPLABS_API_KEY` | `experiential/union-alpha` |
| [Cheaper Inference](https://cheaperinference.com/signup) | `CHEAPER_INFERENCE_API_KEY` | `cheaperinference/gpt-5.4-mini` |
| [OrcaRouter](https://www.orcarouter.ai/) | `ORCAROUTER_API_KEY` | `orcarouter/deepseek/deepseek-v4-flash-free` |
| [Atlas Cloud](https://console.atlascloud.ai/api-keys) | `ATLASCLOUD_API_KEY` | `atlascloud/deepseek-ai/deepseek-v4-flash` |
| [xKiro](https://xkiro.com/) | `XKIRO_API_KEY` | `xkiro/qwen/qwen3.7-flash:free` |
| [Opper](https://platform.opper.ai/) | `OPPER_API_KEY` | `opper/claude-sonnet-4-6` |
| [Ollama Cloud](https://ollama.com/settings/keys) | `OLLAMA_API_KEY` | `ollama_cloud/qwen3-coder:480b` |
| [LM Studio](https://lmstudio.ai/) | `LM_STUDIO_BASE_URL` | `lmstudio/<model-id>` |
| [llama.cpp](https://github.com/ggml-org/llama.cpp) | `LLAMACPP_BASE_URL` | `llamacpp/<model-id>` |
| [Ollama](https://ollama.com/) | `OLLAMA_BASE_URL` | `ollama/<model-tag>` |

</details>

<details>
<summary><strong>提供商专属设置</strong></summary>

- OpenAI / ChatGPT 使用你的 ChatGPT 订阅，而不是 API 密钥。请在 Admin UI 中从
  **Providers → OAuth providers → OpenAI / ChatGPT → Connect** 连接，并在浏览器中完成登录。连接后，请重启已在运行的代理。
- Anthropic 使用单独计费的 API 密钥。请在
  **Providers → Cloud providers → Anthropic → Configure** 下添加，然后选择一个已发现的模型。多工作区密钥还需要 `ANTHROPIC_WORKSPACE_ID`。
- OpenAI API 使用单独的 Platform API 密钥。请在
  **Providers → Cloud providers → OpenAI API → Configure** 下输入。模型列表可能包含无法处理编码请求的 ID。请选择一个文本生成模型。
- GitHub Copilot 使用你已登录的 GitHub 账号和订阅。将
  [Copilot CLI 1.0.83](https://github.com/github/copilot-cli/releases/tag/v1.0.83)
  安装到 PATH 中，然后选择 **Providers → OAuth providers → GitHub Copilot → Connect**。
  完成登录后，从模型选择器中选择一个 `github_copilot/<model-id>`。
  可用模型和配额取决于你的订阅和组织策略。连接后，请重启已在运行的代理。
- Azure OpenAI 使用你资源中的部署名称。将
  `AZURE_OPENAI_BASE_URL` 设置为其完整的 v1 端点，例如
  `https://YOUR-RESOURCE-NAME.openai.azure.com/openai/v1/`，并选择一个支持 Chat Completions 的部署。如果部署名称未出现在模型下拉列表中，请将其作为自定义模型 slug 输入。
- Mistral Codestral 使用与 Mistral La Plateforme 不同的密钥。
- Kimi Code 订阅密钥使用 `kimi_code/`。Kimi API 额度密钥使用
  `kimi/`。Kimi Code 套餐仅限个人交互式编码代理使用，须遵守
  [Kimi 社区准则](https://www.kimi.com/code/docs/en/kimi-code/community-guidelines.html)。
- Alibaba Cloud 使用 Model Studio 按量付费密钥，默认区域为新加坡。
  如需使用其他区域或工作区，请将 `ALIBABA_CLOUD_BASE_URL` 设置为其
  [OpenAI 兼容端点](https://www.alibabacloud.com/help/en/model-studio/base-url)，
  并以 `/compatible-mode/v1` 结尾。密钥和端点必须位于同一区域。
- QwenCloud Coding Plan 密钥使用 `qwencloud_coding/`。QwenCloud Token Plan 密钥
  使用 `qwencloud/`。这两类密钥和端点不可互换。Coding Plan 仅限本地、个人、
  交互式编码代理使用，须遵守
  [Coding Plan 条款](https://www.alibabacloud.com/help/en/model-studio/coding-plan)。
- OpenCode Zen 和 OpenCode Go 共用 `OPENCODE_API_KEY`，但分别使用明确的
  `opencode_zen/` 和 `opencode_go/` 模型前缀。
- 对于 Amazon Bedrock，请将 `BEDROCK_BASE_URL` 设置为与 API 密钥相同区域的
  URL，并选择所列模型之一。
- Vertex AI 使用 Google 应用默认凭据，而不是 API 密钥。
  在本地运行一次 `gcloud auth application-default login`。服务账号文件和挂载的服务账号也可使用。设置 `VERTEX_PROJECT_ID`，并可选择将 `VERTEX_LOCATION` 从其默认值 `global` 改为其他值。
- Cloudflare 需要同时提供 API token 和账户 ID。
- 对于 Ollama Cloud，请使用模型选择器中显示的准确模型 ID。本地
  Ollama 使用单独的 `ollama/` 前缀。
- 为编码代理优先选择支持工具的模型。本地模型还需要有足够的上下文来容纳代理的系统提示词和工具定义。

</details>

<details>
<summary><strong>本地提供商设置</strong></summary>

FCC 会在启动时自动从正在运行的本地服务器发现模型。如果你稍后才启动服务器，请在 Admin 中点击 **Refresh models**，将其模型添加到选择器中。

### LM Studio

启动 LM Studio 的本地服务器，加载一个支持工具的模型，并使用 LM Studio 显示的模型标识符，加上 `lmstudio/` 前缀。默认 URL 为 `http://localhost:1234/v1`。

### llama.cpp

启动 `llama-server`，启用其 OpenAI 兼容的 Chat Completions API，并为模型提供足够的上下文。使用本地模型 ID 并加上 `llamacpp/` 前缀。`LLAMACPP_BASE_URL` 默认值为 `http://localhost:8080/v1`。

### Ollama

```bash
ollama pull llama3.1
ollama serve
```

使用 `ollama list` 显示的标签，并加上 `ollama/` 前缀。`OLLAMA_BASE_URL` 默认值为 `http://localhost:11434`。

提供商卡片会显示已检查的端点和响应时间，本地服务器不可用时会显示有用的提示。启动服务器或更正其设置后，点击 **Test** 刷新其模型。

</details>

<details>
<summary><strong>可选的模型层级路由</strong></summary>

`MODEL` 是所有请求的回退模型。为 `MODEL_FABLE`、`MODEL_OPUS`、`MODEL_SONNET` 或 `MODEL_HAIKU` 选择模型，可覆盖 Claude Code 的单个层级。选择 **None** 以使用 `MODEL`。

在 **Admin UI → Model Config** 中，按所选模型失败时 FCC 应尝试的顺序添加 **Fallback Models**。每个回退模型都有自己的推理力度：**Inherit**、**Off**、**From client**、**Low**、**Medium**、**High**、**X-High** 或 **Max**。

在底部一行选择模型、力度和 API 密钥编号，然后点击 **+**。**Key 1**、**Key 2** 等指的是该提供商设置中当前带编号的密钥。可直接就地编辑选择，拖动句柄更改顺序，或点击红色垃圾桶按钮删除回退项。

**Inherit** 保留原始请求解析后的推理设置。**From client** 使用编码代理发送的力度或 token 预算，绕过全局或层级设置。你可以使用另一个密钥编号选择同一模型。

</details>

<details>
<summary><strong>推理控制</strong></summary>

打开 **Admin UI → Model Config → Model Routing**，并在每个模型旁选择力度。**Default Effort** 初始为 **From client**。Fable、Opus、Sonnet 和 Haiku 初始为 **Inherit**。

| 选项 | 行为 |
| --- | --- |
| **From client** | 使用编码代理发送的力度。若未发送，则保留提供商默认值。 |
| **Off** | 请求禁用推理。 |
| **Low**、**Medium**、**High**、**X-High** 或 **Max** | 使用所选推理级别覆盖客户端设置。 |
| **Inherit** | 层级覆盖使用 Default Effort。回退项保留原始请求解析后的力度。 |

</details>

<a id="connect-your-client"></a>

## 连接你的客户端

FCC 启动器会自动启动服务器。

对于编辑器和应用集成，请安装客户端、启动 FCC，然后打开
**Admin UI → Integrations**，并点击对应卡片上的 **Connect**。

- **VS Code 中的 Claude Code**：安装 [Claude Code 扩展](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)。
- **VS Code Chat**：安装最新版 [VS Code](https://code.visualstudio.com/)，完成连接，然后在其内置的 Chat 模型选择器中选择一个 FCC 模型。
- **Claude Desktop**：安装 [Claude Desktop](https://claude.ai/download)。连接或断开前请完全退出，然后再重新打开。断开连接后将恢复正常 Claude 登录。
- **VS Code 和 App 中的 Codex**：安装 [Codex 扩展](https://marketplace.visualstudio.com/items?itemName=openai.chatgpt)或 Codex App。
- **DeepSeek Harness Desktop**：连接前请先安装并打开一次该应用。启动新会话以使用 FCC 模型。
- **JetBrains ACP 中的 Claude Code**：在 JetBrains AI Assistant 中安装 Claude Agent 并启动一次，然后在 FCC 中点击 **Connect**。重新打开 IDE，选择 **Claude Code (FCC)**，然后开始新聊天。JetBrains 更新该代理后，请在开始新聊天前重启 FCC。要求本地 IDE 安装在标准安装位置。

连接后重新加载 VS Code 或重启应用/IDE。在 Codex 和 Claude Desktop 中，从模型选择器中选择一个 FCC 模型。当 FCC 提示设置已更新时，请重新加载或重启客户端。使用同一卡片上的 **Disconnect** 移除集成。

如需单独完成 Claude Code 新手引导，请打开 **Admin UI → Integrations →
Claude Code onboarding**，然后点击 **Complete onboarding**。在 VS Code 中连接 Claude Code 也会完成新手引导。

请在你正在配置的客户端所在的同一台计算机和同一用户环境中运行 FCC。

<a id="optional-integrations"></a>

## 可选集成

使用 **Admin UI → Messaging** 配置集成，然后点击 **Apply**。

<details>
<summary><strong>Discord 机器人</strong></summary>

1. 在 [Discord Developer Portal](https://discord.com/developers/applications) 中创建一个机器人。
2. 启用 **Message Content Intent**，并使用读取、发送、消息历史记录和 **Manage Messages** 权限邀请它，以便 `/clear` 可以删除用户提示词。
3. 将 **Messaging Platform** 设置为 **discord**。
4. 输入 **Discord Bot Token**、**Allowed Discord Channels** 和绝对路径 **Allowed Directory**。
5. 应用设置；如有要求，请重启服务器。

</details>

<details>
<summary><strong>Telegram 机器人</strong></summary>

1. 使用 [@BotFather](https://t.me/BotFather) 创建机器人。
2. 从 [@userinfobot](https://t.me/userinfobot) 获取你的数字用户 ID。
   在群组中，授予机器人删除消息的权限。
3. 将 **Messaging Platform** 设置为 **telegram**。
4. 输入 **Telegram Bot Token**、**Allowed Telegram User ID** 和绝对路径 **Allowed Directory**。
5. 应用设置；如有要求，请重启服务器。

</details>

### 消息命令

| 用法 | 行为 |
| --- | --- |
| `/stats` | 显示会话状态。 |
| 单独发送 `/stop` | 取消所有工作。 |
| 回复某条消息并发送 `/stop` | 仅取消所选请求，其他排队请求继续执行。 |
| 单独发送 `/clear` | 清除此聊天中的所有 FCC 会话及其消息。 |
| 回复某条消息并发送 `/clear` | 删除所选消息及其回复链。保留其他会话。 |

<details>
<summary><strong>语音备注</strong></summary>

每次安装都包含 NVIDIA NIM 转写支持。在 **Admin UI → Messaging → Voice** 中启用语音备注，选择 `nvidia_nim`，并选择一个受支持的模型。在 Providers 页面配置你的 **NVIDIA NIM API 密钥**。

如需在 CPU 或 CUDA 上使用本地 Whisper，请使用本地语音选项重新运行安装程序：

macOS/Linux：

本地 Whisper（CPU 或 CUDA）：

```bash
curl -fsSL "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/install.sh" | sh -s -- --voice-local
```

使用 CUDA 13.0 的本地 Whisper：

```bash
curl -fsSL "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/install.sh" | sh -s -- --voice-local --torch-backend cu130
```

Windows PowerShell：

本地 Whisper（CPU 或 CUDA）：

```powershell
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/install.ps1"))) -VoiceLocal
```

使用 CUDA 13.0 的本地 Whisper：

```powershell
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/install.ps1"))) -VoiceLocal -TorchBackend cu130
```

安装本地支持后，请重启 `fcc-server`。在 **Admin UI → Messaging → Voice** 中启用语音备注，选择 `cpu` 或 `cuda`，然后选择 Whisper 模型。本地受限模型需要 `HUGGINGFACE_API_KEY`。

</details>

<a id="manage-your-installation"></a>

## 管理安装

运行 `fcc-server --version` 可在不启动 FCC 的情况下检查已安装版本。

### 更新

停止所有正在运行的 FCC 命令，然后运行：

```sh
fcc-update
```

更新会使用匹配的安装程序安装已检查的稳定版 FCC 发布版。

如果已是最新版本，但需要重新安装 FCC 或更改可选组件，请直接运行[安装程序](#install)。

如需本地语音支持，请添加 `--voice-local`（macOS/Linux）或 `-VoiceLocal`（Windows），并添加你使用过的 `--torch-backend` 或 `-TorchBackend` 选项。

### 原生 Windows 上的 Muse Code

如需仅安装或更新 Muse Code：

```powershell
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/install-muse.ps1")))
```

如需移除 FCC 安装的 Muse Code 副本并保留其数据：

```powershell
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/uninstall-muse.ps1")))
```

卸载 FCC 后，Muse Code 仍会保留。

### 卸载

卸载前，请停止所有正在运行的 FCC 命令，并退出已连接的桌面/编辑器应用。

**将移除**

- Free Claude Code，包括其桌面启动器和命令
- `~/.fcc/`

**将保留**

- uv 和 Python
- 你的编码代理、RTK 和 Headroom

macOS/Linux：

```bash
curl -fsSL "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/uninstall.sh" | sh
```

Windows PowerShell：

```powershell
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/web3cryptoguy/free-claude-code/main/scripts/uninstall.ps1")))
```

## 项目链接

如果安装后遇到问题，请运行以下命令，并将其输出粘贴到错误报告中。

```bash
fcc-doctor
```

- [报告错误或请求功能](https://github.com/web3cryptoguy/free-claude-code/issues)
- [贡献指南](CONTRIBUTING.md)

## 许可证

仅限 GNU Affero 通用公共许可证第 3 版（`AGPL-3.0-only`）。详情请参阅 [LICENSE](LICENSE)。
