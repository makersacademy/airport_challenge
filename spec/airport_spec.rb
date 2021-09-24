require 'airport'

RSpec.describe Airport do
  let(:plane) { instance_double(Plane, :id => :PLANE, :is_a? => Plane) }
  let(:other_plane) { instance_double(Plane, :id => :OTHER_PLANE, :is_a? => Plane) }
  
  describe "#initialize" do
    it "initializes with a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "sets a custom capacity given" do
      bigger_airport = Airport.new(20)
      expect(bigger_airport.capacity).to eq 20
    end

    it "raises error unless positive integer given" do
      expect { Airport.new(-1) }.to raise_error(ArgumentError, "Please enter a positive integer")
      expect { Airport.new("1") }.to raise_error(ArgumentError, "Please enter a positive integer")
      expect { Airport.new(0) }.to raise_error(ArgumentError, "Please enter a positive integer")
      expect { Airport.new(3.5) }.to raise_error(ArgumentError, "Please enter a positive integer")
    end
  end

  describe "#land" do
    context "weather shouldn't be considered" do
      before do
        allow(subject).to receive(:rand).and_return(0)
      end
      it "raises error when anything other than plane given" do
        expect { subject.land }.to raise_error(ArgumentError, "Plane not given")
        expect { subject.land(Object.new) }.to raise_error(ArgumentError, "Plane not given")
      end
      
      it "doesn't land a plane already in the airport" do
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error "Plane already in airport"
      end
      
      it "doesn't land planes when airport full" do
        smol_airport = Airport.new(1)
        expect(smol_airport).to receive(:rand).and_return(0)
        smol_airport.land(plane)
        
        expect { smol_airport.land(other_plane) }.to raise_error "Airport full"
      end
    end

    context "when sunny" do
      before(:each) do 
        expect(subject).to receive(:rand).at_least(:once).and_return(0)
      end
      
      it "lands a plane" do
        subject.land(plane)
        expect(subject.planes.include?(plane)).to be true
      end
    end

    context "when stormy" do
      it "prevents landing" do 
        expect(subject).to receive(:rand).at_least(:once).and_return(10)
        expect { subject.land(plane) }.to raise_error "Weather conditions aren't stable"
      end
    end
  end

  describe "#take_off" do
    context "weather should not be considered" do
      before do
        allow(subject).to receive(:rand).and_return(0)
      end

      it "raises error when anything other than plane given" do
        expect { subject.take_off }.to raise_error(ArgumentError, "Plane not given")
        expect { subject.take_off(Object.new) }.to raise_error(ArgumentError, "Plane not given")
      end
      
      it "doesn't take off a plane when not in airport" do
        expect { subject.take_off(plane) }.to raise_error "Plane not in airport"
      end
    end
    context "when sunny" do
      before(:each) do 
        expect(subject).to receive(:rand).at_least(:once).and_return(0)
      end

      it "takes off a plane" do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).to_not include plane
      end
    
      it "confirms a plane has taken off" do
        subject.land(plane)
        expect(subject.take_off(plane)).to eq "Plane has taken off"
      end
      
      it "only takes off the plane given" do
        subject.land(plane)
        subject.land(other_plane)
        subject.take_off(plane)
        expect(subject.planes).to include other_plane
      end
    end

    context "when stormy" do
      it "prevents takeoff" do
        expect(subject).to receive(:rand).exactly(:once).and_return(0)
        subject.land(plane)
        expect(subject).to receive(:rand).at_least(:once).and_return(10)
        expect { subject.take_off(plane) }.to raise_error "Weather conditions aren't stable"
      end
    end
  end
end
