require 'bundler/setup'
Bundler.require

require 'active_record'
require 'rake'

require 'pry'

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

DBRegistry[ENV["PLAYLISTER_ENV"]].connect!
DB = ActiveRecord::Base.connection

# binding.pry
if ENV["PLAYLISTER_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end
