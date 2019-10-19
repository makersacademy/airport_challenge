require 'aircraft'

describe Aircraft do
  it 'Lands an aircraft at the airport' do
    a320 = Aircraft.new("in flight", "none")
    expect(a320.land_aircraft("LHR")).to be true
  end
end
