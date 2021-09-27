require 'airport'
require 'plane'
require 'weather'

describe Airport do
  describe "#land" do
    context "airport is not full" do
      context "weather is good" do
        before(:each) do
          @plane = Plane.new(15)
          expect(Weather).to receive(:rand).and_return(2)
          subject.land(@plane)
        end
    
        it "instructs a plane to land at the airport" do
          expect(subject.planes).to include "Flight 15"
        end
    
        it "tells the plane that it is no longer flying" do
          expect(@plane.status).to eq "Landed"
        end

        it "doesn't let a plane land if it's already grounded" do
          expect(Weather).to receive(:rand).and_return(2)
          expect { subject.land(@plane) }.to raise_error "This plane has already landed"
        end
      end

      context "weather is bad" do
        it "doesn't let the plane land" do
          plane = Plane.new(105)
          expect(Weather).to receive(:rand).and_return(8)
          expect { subject.land(plane) }.to raise_error("Cannot land a plane in stormy weather")
        end
      end
    end

    context "airport is full" do
      it "doesn't let another plane land if airport is full" do
        20.times do |x|
          expect(Weather).to receive(:rand).and_return(2)
          subject.land(Plane.new(x))
        end
  
        twenty_first_plane = Plane.new(21)
  
        expect { subject.land(twenty_first_plane) }.to raise_error("Airport is full")
        expect(subject.planes).to_not include "Flight 21"
      end
  
      it "doesn't let another plane land if airport is full to custom capacity" do
        capacity = 50
        airport = Airport.new(capacity)
        
        capacity.times do |x|
          expect(Weather).to receive(:rand).and_return(2)
          airport.land(Plane.new(x))
        end
  
        extra_plane = Plane.new(51)
  
        expect { airport.land(extra_plane) }.to raise_error("Airport is full")
        expect(airport.planes).to_not include "Flight 51"
      end
    end
  end

  describe "#take_off" do
    context "weather is good" do
      before(:each) do
        @plane = Plane.new(5)
        expect(Weather).to receive(:rand).and_return(2)
        subject.land(@plane)
        expect(Weather).to receive(:rand).and_return(2)
        subject.take_off("Flight 5")
      end
      
  
      it "instructs a plane to take off from the airport" do
        expect(subject.planes).to_not include "Flight 5"
      end
  
      it "tells the plane that it is now flying" do
        expect(@plane.status).to eq "Flying"
      end
    end

    context "weather is bad" do
      it "doesn't let a plane land" do
        plane = Plane.new(10)

        expect(Weather).to receive(:rand).and_return(2)
        subject.land(plane)

        expect(Weather).to receive(:rand).and_return(8)

        expect { subject.take_off(plane) }.to raise_error("Cannot take off in stormy weather")  
      end
    end
  end
end

describe "scenario with multiple planes" do
  before(:each) do
    # Fill the airport with planes
    @airport1 = Airport.new(10)
    @plane1 = Plane.new(1)
    @plane2 = Plane.new(2)
    @plane3 = Plane.new(3)
    @plane4 = Plane.new(4)
    @plane5 = Plane.new(5)
    @plane6 = Plane.new(6)
    @plane7 = Plane.new(7)
    @plane8 = Plane.new(8)
    @plane9 = Plane.new(9)
    @plane10 = Plane.new(10)

    planes = [@plane1, @plane2, @plane3, @plane4, @plane5, @plane6, @plane7, @plane8, @plane9, @plane10]
    planes.each do |plane|
      expect(Weather).to receive(:rand).and_return(2)
      @airport1.land(plane)
    end
  end

  context "airport is full" do
    it "doesn't let new planes land" do
      # Try to land another plane
      plane11 = Plane.new(11)

      # It throws an error, because the airport is full
      expect { @airport1.land(plane11) }.to raise_error "Airport is full"
    end

    it "lets planes take off when passed the flight number" do
      expect(Weather).to receive(:rand).and_return(2)
      @airport1.take_off("Flight 6")

      expect(@airport1.planes).to_not include "Flight 6"
      expect(@plane6.status).to eq "Flying"
    end
  end

  context "flying planes" do
    it "won't let a flying plane take off again" do
      expect(Weather).to receive(:rand).and_return(2)
      @airport1.take_off("Flight 6")

      expect(Weather).to receive(:rand).and_return(2)
      expect { @airport1.take_off("Flight 6") }.to raise_error "This airport does not have this flight number"
    end

    it "can land a flying plane" do
      expect(Weather).to receive(:rand).and_return(2)
      @airport1.take_off("Flight 6")

      expect(Weather).to receive(:rand).and_return(2)
      @airport1.land(@plane6)
      
      expect(@airport1.planes).to include "Flight 6"
    end
  end

  it "doesn't let a plane take off from an airport that doesn't contain the plane" do
    airport2 = Airport.new
    expect(Weather).to receive(:rand).and_return(2)
    expect { airport2.take_off(@plane1) }.to raise_error "This airport does not have this flight number"
  end
end
