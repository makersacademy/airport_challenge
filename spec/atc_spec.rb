require 'atc'
require 'aircraft'
require 'airport'

describe Atc do
  it 'lands an aircraft at Heathrow. Feature test.' do
    swanwick = Atc.new
    a777 = Aircraft.new("in flight", "none", "G-RAES")
    heathrow = Airport.new("LHR")
    expect(swanwick.auth_landing(a777, heathrow, "LHR")).to be true
  end
  it 'takes off an aircraft off from Dublin. Feature test' do
    shannon = Atc.new
    a330 = Aircraft.new("in flight", "none", "EI-GAJ")
    dublin = Airport.new("DUB")
    shannon.auth_landing(a330, dublin, "DUB")
    expect(shannon.auth_takeoff(a330, dublin, "DUB")).to be true
  end
end
