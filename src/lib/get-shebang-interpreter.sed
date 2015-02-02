# ### Remove all the clutter from the shebang line

# This sed one-liner matches the shebang line and extracts the interprer name.

1s_^#!\(/usr\(/local\)\?\)\?/bin/\(env\s\+\)\?\([a-z]\+\).*$_\4_p

# Let's break it down a bit:

# - `1` - On the first line only
# - `s` - Substitute
# - `_` - Use `_` as delimiter instead of `/`

# Matching the line:

# - `^` - match beginning of the line
# - `#!` - match shebang sequence
# - `\(/usr\(/local\)\?\)\?` - match `/usr` or `/usr/local` or nothing
# - `/bin/` - match `/bin/` this is always there
# - `\(env\s\+\)\?` - match `/env ` or nothing
# (and one or more trailing spaces)
# - `\([a-z]\+\)` record the interpreter
# - `.*$` match the rest of the line (.*) up to the end of the line (`$`)

# Up to this point, we have matched the whole line, now comes the substitution:

# - `_\4_` replace by the 4th recorded sequence (interpreter)
# - `p` - print (only if it matches)
