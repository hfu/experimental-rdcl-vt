require 'sqlite3'
require 'sequel'
require 'zlib'
require 'stringio'
require 'fileutils'

Sequel.sqlite('escaped.mbtiles')[:tiles].each {|r|
  z = r[:zoom_level]
  next unless z == 12
  x = r[:tile_column]
  y = (1 << r[:zoom_level]) - r[:tile_row] - 1
  data = r[:tile_data]
  dir = ['rdcl', z, x].join('/')
  FileUtils::mkdir_p(dir) unless File.directory?(dir)
  File.open("#{dir}/#{y}.pbf", 'w') {|w|
    w.print Zlib::GzipReader.new(StringIO.new(data)).read
  }
  print "wrote #{dir}/#{y}.pbf\n"
}
