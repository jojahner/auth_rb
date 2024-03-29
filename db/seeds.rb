# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Admin user
User.create!(
  username: 'admin',
  email:    'admin@localhost.de',
  password: 'password',
  admin:    true
)

# Create sample application

Application.create!(
  name:       'Sample Application',
  key:        'some_key',
  secret_key: 'some_secret_key'
)

