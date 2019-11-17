# prevent landing when the weather is stormy - done
# raises error if trying to take off plane that isnt in the airport - done
# raise error if trying to take off when the plane is already flying - done
# raise an error if trying to land when not in flight
# factor out error messages - done

# things that could be improved upon
# Capacity dependent on the size of the aircraft
# whether the aircraft is reported broken

require 'airport'

describe Airport do
  airport = Airport.new

  describe "initialize" do 
    it "should have a default capacity of 10 planes if no argument is entered" do
      expect(Airport::DEFAULT_CAPACITY).to eq(10)
    end

    it "should have a default capacity of 20 planes if 20 is entered as an argument" do
      airport = Airport.new(20)
      expect(airport.capacity).to eq(20)
    end
  end

  let(:fair_weather) { double(:fair_weather, stormy?: false) }
  let(:stormy_weather) { double(:stormy_weather, stormy?: true) }
  let(:plane_in_flight) { double(:plane_in_flight, in_flight?: true, land: nil, take_off: nil) }
  let!(:plane_on_ground) { double(:plane_on_ground, in_flight?: false, land: nil, take_off: nil) }

  describe "#land_plane" do

    it "should have a land_plane method" do 
      expect(subject).to respond_to(:land_plane).with(2).argument
    end

    it "should be able to land a plane if fair weather" do
      expect(subject.land_plane(plane_in_flight, fair_weather)).to eq([plane_in_flight])
    end

    it "should raise an error if trying to land a plane when the airport is at capacity" do
      expect { 11.times { subject.land_plane(plane_in_flight, fair_weather) } }.to raise_error "Plane cannot land as the Airport is full"
    end

    it "should be able to land 10 planes if user does not specify a capacity" do
      expect { 10.times { subject.land_plane(plane_in_flight, fair_weather) } }.to_not raise_error
    end

    it "should prevent landing if the weather is stormy" do
      expect { subject.land_plane(plane_in_flight, stormy_weather) }.to raise_error "Plane cannot land as the conditions are stormy"
    end

    it "should raise an error if attempting to land when not in flight" do 
      expect { subject.land_plane(plane_on_ground, fair_weather) }.to raise_error "Plane already on the ground"
    end

  end

  describe "#take_off" do

    it "should allow planes to take off" do
      subject.land_plane(plane_in_flight, fair_weather)
      expect(subject.take_off(plane_in_flight, fair_weather)).to eq("Plane has taken-off")
    end

    it "should raise an error if instructing a plane to take off when there are no planes to take off" do 
      expect { subject.take_off(plane_on_ground, fair_weather) }.to raise_error "No planes at the airport"
    end

    it "should prevent take off if the weather is stormy" do
      plane1 = double(:plane1, in_flight?: true, land: false, take_off: nil)
      subject.land_plane(plane1, fair_weather)
      expect { subject.take_off(plane1, stormy_weather) }.to raise_error "Plane cannot take off due stormy weather"
    end

    it "should raise an error if trying to take off a plane that isn't at the airport" do
      plane1 = double(:plane1, in_flight?: true, land: false, take_off: nil)
      plane2 = double(:plane2, in_flight?: true, land: false, take_off: nil)
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land_plane(plane1, fair_weather)
      airport2.land_plane(plane2, fair_weather)
      expect { airport1.take_off(plane2, fair_weather) }.to raise_error "Cannot take off, Plane not at specified airport"
    end

    # it "should raise an error if try"
  end

  describe "#contains_plane?" do 

    it "should return false after a plane has taken off" do 
      plane1 = double(:plane1, in_flight?: true, land: false, take_off: nil)
      subject.land_plane(plane1, fair_weather)
      subject.take_off(plane1, fair_weather)
      expect(subject.contains_plane?(plane1)).to eq false
    end
  end
end
