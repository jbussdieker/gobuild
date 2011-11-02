filename = File.join(File.dirname(__FILE__), "Makefile")
goroot = File.absolute_path(File.dirname(__FILE__))
gobin = File.absolute_path(File.join(goroot, "..", "..", "bin"))
Dir.mkdir(gobin)
data = "all:\n"
data << "\thg clone -r release.r60.3 https://go.googlecode.com/hg/ #{goroot}/hg\n"
data << "\texport GOROOT=#{goroot}/hg;"
  data << "export GOARCH=amd64;"
  data << "export GOOS=linux;"
  data << "export GOBIN=#{gobin};"
  data << "cd #{goroot}/hg/src;"
  data << "./all.bash\n"
data << "install:\n"

File.open(filename, 'w') {|f| f.write(data) }

