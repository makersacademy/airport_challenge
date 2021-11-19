require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { Airport.new }

  it 'default capacity can be overridden' do
    airport = Airport.new(3)
    expect(airport.capacity.length).to be(3)
  end
end