eval %sh{
    # files="
    #     rust.kak
    # "

    for file in ${files}; do
        printf '%s\n' "
            try %{
                source %{${kak_config}/filetype/${file}}
            } catch %{
                echo -debug %val{error}
            }
        "
    done
}

