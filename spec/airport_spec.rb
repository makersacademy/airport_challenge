require 'airport'

describe Airport do

  subject(:airport){Airport.new}
  let(:plane) {double("plane")}


  it 'allows a plane to land' do
    airport.land(plane)
  end

  it 'confirms a landed plane is there' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it "allows a plane to take off" do
    airport.take_off(plane)
  end

  it "confirms a departed plane has departed" do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to_not include plane
  end


end
