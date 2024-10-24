#!/usr/bin/env zsh
#
# Simple loop to upgrade providers in each directory,
# and then update README files

for i (*(/)) {(cd $i; tofu init -upgrade); terraform-docs $i}
