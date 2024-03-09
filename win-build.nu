use common.nu libgit_clone

const targets = ["git2.dll", "git2.exp", "git2.lib", "git2.pdb"]

const outputdir = ("build/win-x64/out" | path expand)

print "Win (system arch)"
mkdir build build/win-x64 build/win-x64/out

libgit_clone build/win-x64/libgit2

cd build/win-x64/libgit2

mkdir build
cd build

print "=== CMAKE CONFIG STEP ==="
cmake ..
 
print "=== CMAKE BUILD STEP ==="
cmake --build .

print "=== CMAKE TEST STEP ==="
cd Debug
./libgit2_tests

$targets | each { |it| 
  print $"Copying ($it) to ($outputdir)"
  cp $it $outputdir 
}

print OK!
