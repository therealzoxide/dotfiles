function shell_motivation
    set -l last_status $status

    set -l fail_message "KILL YOURSELF"

    if test $last_status -ne 0
        set -l chance (math (random) % 10)
        if test $chance -eq 0
            echo ""
            echo "$fail_message"
        end
    end
end

