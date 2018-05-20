require 'airport'

describe Airport do

  describe "#let_plane_land" do
    it "checks plane has landed in airport" do
      plane = Plane.new
      # let airport have sunny weather
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.let_plane_land(plane)
      expect(subject.planes.last).to eq plane
    end

    it "should raise error if weather is stormy" do
      plane = Plane.new
      # let airport have stormy weather
      allow(subject).to receive(:weather).and_return(:stormy)
      expect { subject.let_plane_land(plane) } .to raise_error "cannot land due to stormy weather"
    end

    it "should raise error if plane has already landed" do
      plane = Plane.new
      # let airport have sunny weather
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.let_plane_land(plane)
      expect { subject.let_plane_land(plane) } .to raise_error "cannot land as plane is alrady in airport"
    end

    describe "#capacity" do
      it "has a default capacity of 20" do
        # set weather to be sunny in order for plane to land
        allow(subject).to receive(:weather).and_return(:sunny)
        20.times { subject.let_plane_land(Plane.new) }
        expect { subject.let_plane_land(Plane.new) } .to raise_error "cannot land as airport is full"
      end

      it "has an amendable capacity" do
        capacity = 30
        airport = Airport.new(capacity)
        # set weather to be sunny in order for plane to land
        allow(airport).to receive(:weather).and_return(:sunny)
        capacity.times { airport.let_plane_land(Plane.new) }
        expect { airport.let_plane_land(Plane.new) } .to raise_error "cannot land as airport is full"
      end

    end

  end

  describe "#take_off" do

    it "checks plane has taken off from airport" do
      plane = Plane.new
      # let airport have sunny weather
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.let_plane_land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it "checks plane is no-longer in airport" do
      plane = Plane.new
      # set weather to be sunny in order for plane to land
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.let_plane_land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it "should raise error if weather is stormy" do
      plane = Plane.new
      # set weather to be sunny in order for plane to land
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.let_plane_land(plane)
      # let airport have weather that is stormy
      allow(subject).to receive(:weather).and_return(:stormy)
      expect { subject.take_off(plane) } .to raise_error "cannot take off due to stormy weather"
    end

    it "checks plane is in airport" do
      plane = Plane.new
      # set weather to be sunny in order for plane to land
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.let_plane_land(plane)
      other_airport = Airport.new
      # set weather in other airport to be sunny
      allow(other_airport).to receive(:weather).and_return(:sunny)
      expect { other_airport.take_off(plane) } .to raise_error "plane is not in airport"
    end

  end

  describe "#weather" do

    it "expects airport to respond to weather" do
      expect(subject).to respond_to(:weather)
    end

  end

end
