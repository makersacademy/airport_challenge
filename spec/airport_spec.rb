require 'airport'
require 'plane'

describe Airport do
  before(:each) do 
    @airport = Airport.new
  end

  it 'should have an capacity' do
    expect(@airport.capacity).to be > 0
  end
end