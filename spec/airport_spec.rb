require 'airport'

describe Airport do
  let(:airport) { Airport.new }


  it 'knows when a plane is airborn' do
    plane = double :plane, location: 'air'
    expect(airport.location_of plane).to eq( 'air')
  end

  it 'knows when a plane is in the airport' do
    plane = double :plane, location: 'airport'
    expect(airport.loaction_of plane).to eq('airport')
  end
end
