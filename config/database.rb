if ENV['MONGODB_ADDRESS']
  uri = URI.parse(ENV['MONGODB_ADDRESS'])
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGODB_ADDRESS'], :logger => logger)
  MongoMapper.database = uri.path.gsub(/^\//, '')
else
  MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)
  MongoMapper.database = "fikus_#{Padrino.env}"
end
