use common.nu libgit_clone

const build_targets = ["git2.dll", "git2.exp", "git2.lib"]

const targetdir = ("build" | path join win-x64 | path expand)
const outputdir = ($targetdir | path join out)
const libgitdir = ($targetdir | path join libgit2)

print "Win (system arch)"
mkdir $outputdir

libgit_clone $libgitdir
mkdir ($libgitdir | path join build)
cd ($libgitdir | path join build)

print "=== CMAKE CONFIG STEP ==="
cmake .. -DCMAKE_BUILD_TYPE=Release
 
print "=== CMAKE BUILD STEP ==="
cmake --build . --config Release

print "=== POST-BUILD ==="
cd ($libgitdir | path join build Release)
./libgit2_tests

$build_targets | each { |it|
  print $"Copying ($it) to ($outputdir)"
  cp ($libgitdir | path join build Release $it) $outputdir
}

print "=== COPY OVER .h FILES ==="
cp -r ($libgitdir | path join include) ($outputdir | path join include)

print "=== ZIP ==="
cd $targetdir
7z a win-x64.zip './out/*'

print OK!
