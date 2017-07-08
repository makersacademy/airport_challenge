require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it 'confirms plane can land' do
    expect(airport.confirm_land(plane)).to eq [plane]
  end 

  it 'confirms plane has landed' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

end
