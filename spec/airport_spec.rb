require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { Airport.new }

  it 'default capacity can be overridden' do
    airport = Airport.new(3)
    expect(airport.capacity).to be(3)
  end

  it 'can check for stormy weather' do
    expect (subject.is_stormy?).to be_boolean
  end
end