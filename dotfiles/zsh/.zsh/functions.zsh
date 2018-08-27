# Clone a repo only by its and its dev name.
clone() {
  git clone --depth 1 "https://github.com/$1.git"
}

# Clone a repo specifying the full URL.
cclone() {
  git clone --depth 1 "$1.git"
}
