require 'airport'
require 'plane'
require 'weather'

describe Airport do
  describe "#land" do
    context "airport is not full" do
      before(:each) do
        @plane = Plane.new
        expect(Weather).to receive(:rand).and_return(2)
        subject.land(@plane)
      end
  
      it "instructs a plane to land at the airport" do
        expect(subject.planes).to include @plane
      end
  
      it "tells the plane that it is no longer flying" do
        expect(@plane.flying).to eq false
      end
    end

    context "airport is full" do
      it "doesn't let another plane land if airport is full" do
        20.times do
          expect(Weather).to receive(:rand).and_return(2)
          subject.land(Plane.new)
        end
  
        twenty_first_plane = Plane.new
  
        expect { subject.land(twenty_first_plane) }.to raise_error("Airport is full")
        expect(subject.planes).to_not include twenty_first_plane
      end
  
      it "doesn't let another plane land if airport is full to custom capacity" do
        capacity = 50
        airport = Airport.new(capacity)
        
        capacity.times do
          expect(Weather).to receive(:rand).and_return(2)
          airport.land(Plane.new)
        end
  
        extra_plane = Plane.new
  
        expect { airport.land(extra_plane) }.to raise_error("Airport is full")
        expect(airport.planes).to_not include extra_plane
      end
    end
  end

  describe "#take_off" do
    before(:each) do
      @plane = Plane.new
      expect(Weather).to receive(:rand).and_return(2)
      subject.land(@plane)
      expect(Weather).to receive(:rand).and_return(2)
      subject.take_off(@plane)
    end

    it "instructs a plane to take off from the airport" do
      expect(subject.planes).to_not include @plane
    end

    it "tells the plane that it is now flying" do
      expect(@plane.flying).to eq true
    end
  end
end