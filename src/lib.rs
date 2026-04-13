use zed_extension_api::{self as zed, Command, LanguageServerId, Result, Worktree};

struct ZenCExtension;

impl ZenCExtension {
    fn repo_binary_path(worktree: &Worktree) -> String {
        let root = worktree.root_path();
        if root.ends_with('/') {
            format!("{root}zenc/zc")
        } else {
            format!("{root}/zenc/zc")
        }
    }
}

impl zed::Extension for ZenCExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<Command> {
        let command = if worktree.read_text_file("zenc/README.md").is_ok() {
            Self::repo_binary_path(worktree)
        } else {
            worktree.which("zc").ok_or_else(|| {
                "unable to find `zc` in PATH or `zenc/zc` in the workspace".to_string()
            })?
        };

        Ok(Command {
            command,
            args: vec!["lsp".to_string()],
            env: worktree.shell_env(),
        })
    }
}

zed::register_extension!(ZenCExtension);
