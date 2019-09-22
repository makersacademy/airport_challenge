require 'airport'

describe Airport do

  describe "Landing a plane at an aiport" do
    it "should show the plane to be in the hangar" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to include plane
    end
  end

  describe "Plane takes off from an airport" do
    it "should show the plane is no longer in the hangar" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to_not include plane
    end
  end

  describe "Planes take off when the weather is clear" do
    it "should allow a plane to take off and not return an error" do
      plane = Plane.new
      error = 'Unable to take off due to stormy weather'
      allow(subject.weather).to receive(:stormy?).and_return(false)
      expect { subject.take_off(plane) }.not_to raise_error error
    end
  end

  describe "Planes attempts take off when the weather is stormy" do
    it "should not allow the plane to take off and raise an error" do
      allow(subject.weather).to receive(:stormy?).and_return(true)
      plane = Plane.new
      error = 'Unable to take off due to stormy weather'
      plane.is_not_flying
      expect { subject.take_off(plane) }.to raise_error error
    end
  end

  describe "Plane tries to land when it is clear" do
    it "should allow the plane to land and not raise an error" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      error = 'Unable to land due to stormy weather'
      expect { subject.land(plane) }.to_not raise_error error
    end
  end

  describe "Plane tries to land when it is stormy" do
    it "should should not allow the plane to land and raise an error" do
      allow(subject.weather).to receive(:stormy?).and_return(true)
      plane = Plane.new
      error = 'Unable to land due to stormy weather'
      expect { subject.land(plane) }.to raise_error error
    end
  end

  describe "Landing a plane when an airport is full at its default capacity" do
    it "should not allow the plane to land and return an error" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      allow(plane).to receive(:is_not_flying).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      error = "Can't land, airport is full"
      expect { subject.land(plane) }.to raise_error error
    end
  end

  describe "Setting airport capacity, reaching capacity and landing a plane" do
    it "should not allow the plane to land and raise an error" do
      airport = Airport.new(20)
      allow(airport.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      allow(plane).to receive(:is_not_flying).and_return(false)
      airport.capacity.times { airport.land(plane) }
      error = "Can't land, airport is full"
      expect { airport.land(plane) }.to raise_error error
    end
  end

  describe "Plane tries to land again after already landing" do
    it "should not land and return an error" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      error = "Plane has already landed"
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error error
    end
  end

  describe "Plane tries to take off again after already taking off" do
    it "should not take off and return an error" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      error = "Plane is already in the air"
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error error
    end
  end

end
