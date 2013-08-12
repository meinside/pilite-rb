Gem::Specification.new do |s|
  s.name        = 'pilite'
  s.version     = '0.0.2'
  s.platform    = Gem::Platform::RUBY
  s.date        = '2013-08-12'
  s.summary     = "Rubygem for using 'Pi-LITE' board on the Raspberry Pi"
  s.description = "Rubygem for sending commands to 'Pi-LITE' board through serial port communication"
  s.authors     = ["Sungjin Han"]
  s.email       = 'meinside@gmail.com'
  s.files       = Dir["lib/*.rb"] + Dir["bin/*"]
  s.executables << "pilite"
  s.require_paths << "lib"
  s.add_dependency("serialport", ">= 0")
  s.add_dependency("thor", ">= 0")
  s.homepage    = 'http://github.com/meinside/pilite-rb'
  s.license     = 'MIT'
end
