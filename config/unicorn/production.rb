worker  = 2
timeout = 30
app_dir = "/var/www/mumu/current"
listen  = File.expand_path 'tmp/sockets/.unicorn.sock', $app_dir
pid     = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
std_log = File.expand_path 'log/unicorn.log', $app_dir

orker_processes  $worker
orking_directory $app_dir
tderr_path $std_log
tdout_path $std_log
imeout $timeout
isten  $listen
id $pid

reload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill "QUIT", File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
