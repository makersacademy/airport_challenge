require './lib/airport'
require './lib/plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  it 'exists' do
    expect(airport).to be_instance_of(Airport)
  end
  context 'land' do
    it 'responds to #land' do
      expect(airport).to respond_to(:land)
    end
    it 'welcome the plane at the airport, landing successful' do
      expect(airport.land(plane)).to include(plane)
    end
    it "throws an error if the plane already at the airport" do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error("This plane is already at the airport")
    end  
    it "throws an error when the airport is full" do
        airport = Airport.new(@capacity = 50)
        @capacity.times {airport.land(Plane.new)}
        expect { airport.land(plane) }.to raise_error("The airport is full, wait please")
    end
  end
  context 'take_off' do
    it 'responds to #take_off' do
      expect(airport).to respond_to(:take_off)
    end
    it 'send the plane to its destination, see you soon!' do
      expect(airport).to respond_to(:take_off)
    end
    it 'the plane has already left' do
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) } .to raise_error("already gone")
    end  
    it "throws an error if the weather is stormy" do
        allow(airport).to receive(:stormy) { 5 }
        expect { airport.take_off(plane) }.to raise_error("Let's wait for the sunshine!")
    end
  end   
end