# Agents and AI instructions

- Inline new variables and functions used only once
- For bug fixes, change the fewest lines that solve the problem
- Never remove comments
- Re-read files after each new prompt and keep user edits
- Use easy to read words for variable, function, struct, and class names
- Avoid em-dashes (prefer semicolons, colons and commas)
- Use Oxford commas
- Use United States spelling and punctuation


## Git Commits

- Never commit to default branches (main/master/trunk). Instead branch with a relevant name off origin/HEAD.
- Generally prefer amending existing commits, especially for functionality fixes, and update the commit message to note the fix instead of creating follow-up fix commits.
- For `git commit` and `git commit --amend` messages:
  - use subject/body form with a dash-list body, a subject line of < 51 characters, and body lines < 73 characters
  - use real newlines in commit messages instead of `\n`
  - wrap filenames, code snippets, variables, and identifiers in backticks
  - never add co-authored-by lines that call out the names of AI tools like Claude or Codex
  - never embed literal `\n` in `-m` arguments
  - when a body is needed, write the message with real newlines using `git commit -F - <<'EOF' ... EOF` or a temporary message file
  - for multi-line commit messages, prefer `git commit -F - <<'EOF'` over shell-escaped `git commit -m` strings
  - inside Codex or Claude, do not try to GPG-sign commits; use `git -c commit.gpgsign=false commit ...` and `git -c commit.gpgsign=false commit --amend ...`
  

## Shell and scripts

- Prefer the most readable shell over defensive parsing or micro-optimizations.
- Make reasonable simplifying assumptions when they keep scripts obvious.
- Temporary regression checks are fine while developing a fix.


// end of file.
