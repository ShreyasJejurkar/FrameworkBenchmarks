require_relative 'auto_tune'

worker_processes, = auto_tune
listen "/tmp/unicorn.sock", :backlog => 4096

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

before_fork do |server, worker|
end

after_fork do |server, worker|
end
