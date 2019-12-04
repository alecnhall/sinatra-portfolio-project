# This file is for how app is loaded up onto server

require './config/environnment'

if ActiveRecord::Migrator.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve this issue.'
end

use Rack::MethodOverride # middleware 
use FoodItemsController
use PantryController
use UsersController
run ApplicationController