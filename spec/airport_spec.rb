require 'airport'

describe Airport do
  let(:airport) { Airport.new }


  it 'knows when a planes is airborn' do
    plane = double :plane, location: 'air'
    expect(airport.location_of plane).to eq( 'air')
  end
end
