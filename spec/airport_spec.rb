require 'airport'

describe Airport do
  # let(:plane) { double("plane", position => true ) }
  let(:flying_plane) { double("flying plane", :position => "air" ) }
  let(:landed_plane) { double("landed plane", :position => "airport") }


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

    it "prevents landing if the airport is full if default capacity is overridden" do
      subject.stormy_weather = false
      subject.capacity = 5
      expect { (subject.capacity + 1).times { subject.land(flying_plane) } }.to raise_error "Planes can't land, the airport is full"
    end
  end

  context "#take_off" do
    it "allows a plane to take off from the airport" do
      subject.stormy_weather = false
      subject.take_off(landed_plane)
      expect(subject.planes).to_not include(landed_plane)
    end

    it "prevents take off if weather is stormy" do
      subject.stormy_weather = true
      expect { subject.take_off(landed_plane) }.to raise_error "Weather is stormy"
    end

    it "prevents take off if the plane is flying" do
      expect { subject.take_off(flying_plane) }.to raise_error "The plane is flying, cannot take off"
    end
  end
end
