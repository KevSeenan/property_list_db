require('pry-byebug')
require_relative('./models/Property.rb')

Property.delete_all()

property1 = Property.new(
  {
    'build_type' => 'Detached' ,
    'bedrooms' => 3,
    'year_built' => 1975,
    'buy_let_status' => 'Buy'
  }
)

property2 = Property.new(
  {
    'build_type' => 'Semi-Detached' ,
    'bedrooms' => 2,
    'year_built' => 1926,
    'buy_let_status' => 'Buy'
  }
)

property3 = Property.new(
  {
    'build_type' => 'End Terrace',
    'bedrooms' => 3,
    'year_built' => 1984,
    'buy_let_status' => 'Let'
  }
)

property1.save()
property2.save()
property3.save()

binding.pry
nil
