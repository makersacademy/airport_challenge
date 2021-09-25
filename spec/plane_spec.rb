require 'airport'

describe Airport do

  context 'landing planes' do
    let(:airport) { Airport.new }
    it "lands a plane and stores it" do
      plane = double("Plane")
      weather = double("Safe weather")
      allow(weather).to receive(:stormy).and_return(false)
      airport.land(plane, weather)
      expect(airport.hangar.length).to eq(1)
    end
    it "doesn't land when airport is full" do
      weather = double("Safe weather")
      allow(weather).to receive(:stormy).and_return(false)
      50.times { airport.land(double("Plane"), weather) }
      expect { airport.land(double("Plane"), weather) }.to raise_error("Airport full")
    end
    it "defaults to a capacity of 50" do
      expect(airport.capacity).to eq(50)
    end
  end

  context 'flying planes' do
    let(:airport) { Airport.new }
    it "can tell planes to take off" do
      plane = double("Plane")
      weather = double("Safe weather")
      allow(weather).to receive(:stormy).and_return(false)
      expect{airport.take_off(plane, weather)}.not_to raise_error
    end
    it "removes planes from the hangar when they take off" do
      plane_1 = (double("Plane"))
      plane_2 = (double("Plane2"))
      weather = double("Safe weather")
      allow(weather).to receive(:stormy).and_return(false)
      airport.land(plane_1, weather)
      airport.land(plane_2, weather)
      airport.take_off(plane_1, weather)
      expect(airport.hangar.include?(plane_1)).to eq false
    end
  end
  
  context 'weather' do
    let(:airport) { Airport.new }
    it "doesn't let planes take off or land if the weather is bad" do
      plane = double("Plane")
      weather = double("Stormy weather")
      allow(weather).to receive(:stormy).and_return(true)
      expect { airport.land(plane, weather) }.to raise_error("Dangerous weather")
      expect { airport.take_off(plane, weather) }.to raise_error("Dangerous weather")
    end
  end
end