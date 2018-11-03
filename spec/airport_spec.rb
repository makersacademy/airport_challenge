require 'airport'

describe Airport do
  let(:plane) { double("plane", :location => "air") }
  let(:flying_plane) { double("flying plane", :location => "air") }
  let(:plane_at_airport) { double("landed plane", :location => "airport") }


  context "#land" do
    it "is able to land a plane at the airport" do
      subject.stormy_weather = false
      subject.land(flying_plane)
      expect(subject.planes).to include(flying_plane)
    end

    it "prevents landing if weather is stormy" do
      subject.stormy_weather = true
      expect { subject.land(flying_plane) }.to raise_error "Planes can't land, weather is stormy"
    end

    it "prevents landing after airport's default capacity was exceeded " do
      subject.stormy_weather = false
      expect { (subject.capacity + 1).times { subject.land(flying_plane) } }.to raise_error "Planes can't land, the airport is full"
    end

    it "prevents landing if the airport is full after the default capacity is overridden" do
      subject.stormy_weather = false
      subject.capacity = 5
      expect { (subject.capacity + 1).times { subject.land(flying_plane) } }.to raise_error "Planes can't land, the airport is full"
    end

    it "prevents landing if plane has already landed" do
      subject.stormy_weather = false
      expect { subject.land(plane_at_airport) }.to raise_error "The plane landed and cannot land again"
  end
end

  context "#take_off" do
    it "allows a plane to take off from the airport" do
      subject.stormy_weather = false
      subject.take_off(plane_at_airport)
      expect(subject.planes).to_not include(plane_at_airport)
    end

    it "prevents take off if weather is stormy" do
      subject.stormy_weather = true
      expect { subject.take_off(plane_at_airport) }.to raise_error "Weather is stormy"
    end

    it "prevents take off if the plane is flying" do
      subject.stormy_weather = false
      expect { subject.take_off(flying_plane) }.to raise_error "The plane is flying, cannot take off"
    end
  end
end
