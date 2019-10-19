require 'aircraft'

describe Aircraft do
  it 'Lands an aircraft at the airport' do
    a320 = Aircraft.new("in flight", "none")
    expect(a320.land_aircraft("LHR")).to be true
  end
  it 'Receive an error if trying to land an aircraft already landed' do
    a320 = Aircraft.new
    expect { a320.land_aircraft("LHR") }.to raise_error("aircraft landed - cannot land again")
  end
end
