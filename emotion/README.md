# emotion

Make your shell care about the output from the last command. Non-zero exit codes will show a negative emoji while zero exits will show a happy one. Choose from a list of available emojii to only use the ones you like.

## Options

- Colors - Change the `COLOR_SCHEME` variable to select colors from a predefined list or create your own. Built-in options include: `slate`, `fish` and `default`.
- Emoji list - Modify which emojii display for both success and error outcomes. Change the `active` list in the functions `random_success` and `random_error` to select which ones to use.

![emotion](preview.png?raw=true)

(Shown with the `fish` color scheme)