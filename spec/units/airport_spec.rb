require 'Airport'

RSpec.describe Airport do
  it 'instructs a plane to land' do
    airport = Airport.new
    plane = double('a plane')

    expect(airport.land(plane)).to eq [plane]
  end
end
