function trash -d "Move a specified file to the Trash"
  if [ (count $argv) -gt 0 ]
    set -l trash_dir "$HOME/.Trash"
    for item in $argv
      if test -e $item
        set -l item_name (basename $item)
        set -l dest "$trash_dir/$item_name"
        if test -e "$dest"
          # Real Trash semantics: never clobber an earlier trashed file.
          # Suffix with the epoch, then a counter, until the name is free.
          set -l current_time (date "+%s")
          set dest "$trash_dir/$item_name $current_time"
          set -l counter 1
          while test -e "$dest"
            set counter (math $counter + 1)
            set dest "$trash_dir/$item_name $current_time-$counter"
          end
        end
        # -n as a last line of defence against a race on the free name.
        mv -n "$item" "$dest"
      end
    end
  else
    echo "No arguments given"
  end
end
