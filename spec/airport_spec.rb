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
      bad_inputs = [-1, "1", 0, 3.5]
      message = "Please enter a positive integer"

      bad_inputs.each do |bad_input|
        expect { Airport.new(bad_input) }.to raise_error(ArgumentError, message)
      end
    end
  end

  describe "#land" do
    context "weather shouldn't be considered" do
      before do
        allow(subject).to receive(:rand).and_return(0)
      end
      it "raises error when anything other than plane given" do
        bad_inputs = [nil, Object.new]
        message = "Plane not given"

        bad_inputs.each do |bad_input|
          expect { subject.land(bad_input) }.to raise_error(ArgumentError, message)
        end  
      end
      
      it "doesn't land a plane already in the airport" do
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error "Plane already in airport"
      end
      
      it "doesn't land planes when airport full" do
        smol_airport = Airport.new(1)
        allow(smol_airport).to receive(:rand).and_return(0)
        smol_airport.land(plane)
        
        expect { smol_airport.land(other_plane) }.to raise_error "Airport full"
      end
    end

    context "when sunny" do
      before(:each) do 
        allow(subject).to receive(:rand).and_return(0)
      end

      it "confirms the plane has been landed" do
        
        expect(subject.land(plane).at_airport?(plane)).to be true
      end
    end
    context "when stormy" do
      it "prevents landing" do 
        allow(subject).to receive(:rand).and_return(10)
        
        message = "Weather conditions aren't stable"
        expect { subject.land(plane) }.to raise_error message
      end
    end
  end

  describe "#take_off" do
    context "weather should not be considered" do
      before do
        allow(subject).to receive(:rand).and_return(0)
      end

      it "raises error when anything other than plane given" do
        bad_inputs = [nil, Object.new]
        message = "Plane not given"

        bad_inputs.each do |bad_input|
          expect { subject.take_off(bad_input) }.to raise_error(ArgumentError, message)
        end
      end
      
      it "doesn't take off a plane when not in airport" do
        expect { subject.take_off(plane) }.to raise_error "Plane not in airport"
      end
    end

    context "when sunny" do
      before(:each) do 
        allow(subject).to receive(:rand).and_return(0)
      end

      it "confirms the plane has taken off" do
        subject.land(plane)

        expect(subject.take_off(plane).at_airport?(plane)).to be false
      end
      
      it "only takes off the plane given" do
        subject.land(plane)
        subject.land(other_plane)

        expect(subject.take_off(plane).at_airport?(other_plane)).to be true
      end
    end

    context "when stormy" do
      it "prevents takeoff" do
        allow(subject).to receive(:rand).and_return(0)
        subject.land(plane)
        allow(subject).to receive(:rand).and_return(10)
        
        message = "Weather conditions aren't stable"
        expect { subject.take_off(plane) }.to raise_error message
      end
    end
  end
end
