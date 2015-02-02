# ### Start the CODE block

# - `/^\s*[^#]/` on all non-comment lines
# - `/^#!/ && (1 == NR)` or if the first line is shebang
# - `&& (!CODE)` - but only if not in code block
(/^\s*[^#]/ || (/^#!/ && (1 == NR))) && (!CODE) {
    print "\n"
    CODE = 1
}

# ### End the CODE block

# - `/^#[^!]/` when you find a comment
# - `&& (CODE)` - and you are currently in CODE block
/^#[^!]/ && (CODE) { CODE = 0 }

# ### Printing

# Indent the CODE and remove the comment before printing
{
    if (CODE) {
        print "    " $0
    } else {
        sub(/^\s*# ?/, "")
        print
    }
}
