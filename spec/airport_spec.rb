require 'airport'
require 'plane'

describe 'Airport' do
  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "has a default capacity which can be changed as required" do
    airport.capacity = 20
    expect(airport.capacity).to eq(20)
  end
  
  describe 'conditions for #land(plane)' do
    it "allows airport to accept landing plane" do
      allow(airport).to receive(:land)
      airport.hangar << plane
      expect(airport.hangar).to include(plane)
    end
  end
  
  describe 'conditions for #take_off(plane)' do
    it "allows airport to release plane in take off" do
      allow(airport).to receive(:take_off)
    end
  end
  

end
