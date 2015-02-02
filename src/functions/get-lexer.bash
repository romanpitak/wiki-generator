# ### Get lexer from interpreter

# Multiple interpreters use the same lexer

get-lexer-from-interpreter() {
    case "$1" in
        sh|csh|ksh|bash|sed)
            echo 'sh'
            ;;
        awk)
            echo 'awk'
            ;;
    esac
}
export -f get-lexer-from-interpreter

# ### Get lexer

# Get lexer name from file

# Function tests shebang line, file extension and file name
# to determine the proper lexer
get-lexer() {
    lexer=0
    file=$1
    shebang="$("${libDir}/get-shebang-interpreter" "$file")"
    lexer="$(get-lexer-from-interpreter "${shebang}")"
    if test ! -n "${lexer}"; then
        lexer="$(get-lexer-from-interpreter "${file##*.}")"
    fi
    if test ! -n "${lexer}"; then
        case "$file" in
            Makefile )
                lexer='make'
                ;;
        esac
    fi
    echo "${lexer}"
}
export -f get-lexer
