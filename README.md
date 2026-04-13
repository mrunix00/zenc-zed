# ZenC Extension for Zed

This extension provides Zed with syntax highlighting and LSP support for [ZenC](https://www.zenc-lang.org/).

# Configuration

Add LSP configuration in your `settings.json`:

```json
{
  "lsp": {
    "zenc-lsp": {
      "binary": {
        "path": "/path/to/zc",
        "arguments": ["lsp"]
      }
    }
  }
}
```
