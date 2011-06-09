RAILS_ENV     	= ENV['RAILS_ENV'] = 'production'
RAILS_ROOT    	= ENV['RAILS_ROOT'] = '/var/data/app/current'
BIN_PATH		= "/usr/local/rvm/gems/ree-1.8.7-2011.03/bin"
God.log_file  	= "#{RAILS_ROOT}/log/god.log"
God.log_level 	= :info

%w(redis resque).each do |config|
  God.load "#{RAILS_ROOT}/config/god/#{config}.god"
end