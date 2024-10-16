#!/bin/bash

sync_path () {
	for pane in $(tmux list-panes -F '#P'); do
		tmux send-keys -t ${pane} "cd $1" C-m
	done
}

read -p "Enter Path: " path

sync_path $path

exit 0
