

# ### Main

# loop through git added files and convert them to markdown

tmpDir="wiki"
for fileName in $(git ls-files); do
    fileDir="${tmpDir}/$(dirname "${fileName}")"
    mkdir -p "${fileDir}"
    case "${fileName##*.}" in
        md|txt|LICENSE )
            cp "${fileName}" "${fileDir}"
            ;;
        * )
            lexer="$(get-lexer "${fileName}")"
            echo "# ${fileName}" > "${tmpDir}/${fileName}.md"
            "${libDir}/sh2gfm" -v lexer="${lexer}" "${fileName}" >> "${tmpDir}/${fileName}.md"
            ;;
    esac
done
find "${tmpDir}"

# EOF
