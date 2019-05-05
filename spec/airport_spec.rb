require 'airport'

describe 'Airport' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  it "Approves planes to land" do
    airport.land(plane)
    expect(airport.land(plane)).to eq true
  end

end
