require './lib/airport'
require './lib/plane'

describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}
  it 'exists' do
    expect(airport).to be_instance_of(Airport)
  end
  context 'land' do
    it 'responds to #land' do
      expect(airport).to respond_to(:land)
    end
    it 'is waiting at the airport after landing' do
      expect(airport.land(plane)).to include(plane)
    end
    it "throws an error if the plane already in the airport" do
      airport.land(plane)
      expect {airport.land(plane)}.to raise_error("This plane is already in the airport")
    end  
  end
  context 'take_off' do
    it 'responds to #take_off' do
      expect(airport).to respond_to(:take_off)
    end
    it 'send the plane to its destination, see you soon!' do
      expect(airport.take_off(plane)).not_to include(plane)
    end
    it 'thows an error if the plane has already left' do
      airport.take_off(plane)
      expect {airport.take_off(plane)}.to raise_error("This plane has already left the airport")
    end   
  end   
end