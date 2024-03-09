# This is kind of in it's own corner because I wanted to be able to reuse this on macOS or Linux, but never tried doing so ಠ_ಠ

export const LIBGIT_TAG = "v1.7.2"

export def libgit_clone [path] {  
  if ($path | path exists) {
    print $"Cleaning ($path)"
    rm -r $path
  }
  print $"Cloning libgit2 on tag ($LIBGIT_TAG)"
  git clone https://github.com/libgit2/libgit2.git $path -b $LIBGIT_TAG --depth 1
  "OK"
}

