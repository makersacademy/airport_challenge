require 'airport'
require 'weather'

describe Airport do
    
  let(:mockPlane) { double :plane }
  let(:mockPlane2) { double :plane }
  let(:mockStormyWeather) { double :weather, :generate => "Stormy" }
  let(:mockSunnyWeather) { double :weather, :generate => "Sunny" }

  describe "#land" do
    it "lands a plane and stores it" do
      subject.land(mockPlane)
      expect(subject.planes[-1]).to eq mockPlane
    end
    it "throws an error if the airport is already full" do
      DEFAULT_CAPACITY.times { subject.land(mockPlane) }
      expect { subject.land(mockPlane2) }.to raise_error("Airport is full!!")
    end
    it "DEFAULT_CAPACITY overriden and trying to land plane in full airport" do
      airport = Airport.new(5)
      expect { 6.times { airport.land(mockPlane) } }.to raise_error("Airport is full!!")
    end
    it "Throws an error when a plane is attempted to land in stormy weather" do
      expect { subject.land(mockPlane, mockStormyWeather.generate) }.to raise_error("No landing here! way too stormy!")
    end
  end

  describe "#take_off" do
    it "lands and takes off a plane" do
      subject.land(mockPlane)
      expect(subject.take_off).to eq mockPlane
    end
    it "removes the plane from the airport" do
      subject.land(mockPlane)
      subject.take_off
      expect(subject.planes).to eq []
    end
    it "throws an error if #take_off is called and the airport is empty" do
      expect { subject.take_off }.to raise_error("No planes to take off!!")
    end
    it "It blocks a plane from taking off if the weather is bad" do
      subject.land(mockPlane)
      expect { subject.take_off(mockStormyWeather.generate) }.to raise_error("It is too stormy! No planes taking off!")
    end
  end
end
