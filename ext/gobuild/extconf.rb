require 'erb'

builddir = File.absolute_path(File.dirname(__FILE__))

template_file = File.join(builddir, "Makefile.erb")
make_file = File.join(builddir, "Makefile")
goroot = builddir
gobin = File.join(builddir, "..", "..", "bin")

Dir.mkdir(gobin)

template = ERB.new(File.read(template_file))
result = template.result(binding)
File.open(make_file, 'w') {|f| f.write(result) }

