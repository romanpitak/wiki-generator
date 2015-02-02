# ### Start the CODE block

# - `/^\s*[^#]/` on all non-comment lines
# - `/^#!/ && (1 == NR)` or if the first line is shebang
# - `&& (!CODE)` - but only if not in code block
(/^\s*[^#]/ || (/^#!/ && (1 == NR))) && (!CODE) {
    print "\n```" lexer
    CODE = 1
}

# ### End the CODE block

# - `/^#[^!]/` when you find a comment
# - `&& (CODE)` - and you are currently in CODE block
/^#[^!]/ && (CODE) {
    print "```\n"
    CODE = 0
}

# ### Printing

# If not in CODE block, remove the comment
(!CODE) { sub(/^\s*# ?/, "") }

# print every line
{ print }

# If the source ended on CODE, end the CODE  block
END {
    if (CODE) {print "```\n"}
}
