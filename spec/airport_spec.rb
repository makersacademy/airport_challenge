require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

describe Airport do
  it 'Checks that an Airport is actually an instance of the Airport class' do
    airport = Airport.new
    expect( airport).to be_kind_of(Airport)
  end

  it 'Checks that the Airport\'s capacity can be overridden as appropriate' do
    airport = Airport.new
    new_capacity_value = 100
    airport.update_capacity(new_capacity_value)
    expect( airport.capacity).to eql(new_capacity_value)
  end

end