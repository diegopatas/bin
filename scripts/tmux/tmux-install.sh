#!/bin/bash

tmux_dir_tpm="~/.tmux/plugins/tpm/"
if [ -d $tmux_dir_tpm ] ; then
  echo "Ok"
else
  echo "notok"
fi

