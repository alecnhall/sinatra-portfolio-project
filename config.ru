# This file is for how app is loaded up onto server

require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride # middleware 
use ItemsController
use PantriesController
use UsersController
run ApplicationController