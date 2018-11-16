#!/bin/sh
SESSION=cleo
WINDOW=work
APP_DIRECTORY=~/code/cleo-app
BACKEND_DIRECTORY=~/code/cleo-backend

tmux new -s $SESSION -d

tmux rename-window -t $SESSION $WINDOW
tmux split-window -t $SESSION -v
tmux split-window -t $SESSION -h 
tmux send-keys -t $SESSION.1 "tmux resize-pane -t 1 -y 15" Enter
tmux send-keys -t $SESSION.1 "clear" Enter

tmux send-keys -t $SESSION.0 "cd $BACKEND_DIRECTORY; clear; vim README.md" Enter
tmux send-keys -t $SESSION.1 "cd $BACKEND_DIRECTORY; clear" Enter
tmux send-keys -t $SESSION.2 "cd $BACKEND_DIRECTORY; clear; cleo-server" Enter
tmux attach -t $SESSION.0
