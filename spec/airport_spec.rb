require 'airport'
require 'plane'

describe 'Airport' do
  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "has a default capacity which can be changed as required" do
    airport.capacity = 20
    expect(airport.capacity).to eq(20)
  end
  
  describe 'conditions for #land' do
    it "allows airport to accept landing plane" do
      allow(airport).to receive(:land)
      airport.hangar << plane
      expect(airport.hangar).to include(plane)
    end
    
    context 'when airport hangar is full' do
      it "raises an error" do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error 'Error: Cannot land plane, hangar is full' 
      end
    end
  end
  
  describe 'conditions for #take_off' do
    it "allows airport to release plane in take off" do
      allow(airport).to receive(:take_off)
    end
  end
  

end
