require 'airport'
require 'aircraft'

describe Airport do
  it 'Lands a plane - into array. Unit test' do
    heathrow = Airport.new("LHR")
    b747 = Aircraft.new("in flight")
    expect(heathrow.airport_landing(b747)).to be true
  end
end
