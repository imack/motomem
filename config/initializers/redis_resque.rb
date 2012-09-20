require 'resque/failure/multiple'
require 'resque/failure/airbrake'
require 'resque/failure/redis'

REDIS_CONFIG = YAML.load( File.open( Rails.root.join("config/redis.yml") ) )

redis_base = Redis.new(REDIS_CONFIG[::Rails.env].symbolize_keys!)

Resque.redis = redis_base
Resque.redis.namespace = "resque:motomem"

Resque::Failure::Airbrake.configure do |config|
  config.api_key = '5a4c06523fc12a7bd1e82f431a33d6e8'
end

#Resque::Failure::Multiple.classes = [Resque::Failure::Redis, Resque::Failure::Airbrake]
Resque::Failure.backend = Resque::Failure::Multiple

unless defined?(RESQUE_LOGGER)
  f = File.open("#{Rails.root}/log/resque.log", 'a+')
  f.sync = true
  RESQUE_LOGGER = ActiveSupport::BufferedLogger.new f
end

$redis = Redis::Namespace.new(REDIS_CONFIG[::Rails.env][:namespace], :redis => redis_base)
$redis.flushdb if Rails.env.test?

