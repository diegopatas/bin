#!/bin/bash

printf "NEW TMUX SESSION SCRIPT\n"

read -p "Enter Session Name: " session
read -p "Enter Command: " cmd

tmux new-session -d -s $session

tmux rename-window -t $session:1 'git'
tmux send-keys -t $session:1 "$cmd" C-m
tmux new-window -t $session:2 -n 'shell'
tmux send-keys -t $session:2 "$cmd" C-m
tmux new-window -t $session:3 -n 'code'
tmux send-keys -t $session:3 "$cmd" C-m
tmux new-window -t $session:4 -n 'test'
tmux send-keys -t $session:4 "$cmd" C-m

exit 0
