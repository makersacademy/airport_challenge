require 'atc'
require 'aircraft'
require 'airport'

describe Atc do
  it 'Lands an aircraft at Heathrow' do
    swanwick = Atc.new
    a777 = Aircraft.new("in flight", "none")
    heathrow = Airport.new("LHR")
    expect(swanwick.auth_landing(a777, heathrow, "LHR")).to be true
  end
end
