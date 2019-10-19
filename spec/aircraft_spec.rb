require 'aircraft'

describe Aircraft do
  it 'Lands an aircraft at the airport' do
    a320 = Aircraft.new("in flight")
    expect(a320.land_aircraft).to be true
  end
end
