require 'aircraft'

describe Aircraft do
  it 'Lands an aircraft at the airport' do
    expect(subject.land_aircraft).to be true
  end
end
