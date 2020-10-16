require 'airport'

describe Airport do
  let(:plane) { double(:takeoff => nil, :land => nil, :location => "flying") }
  
  describe "creating a new airport" do
    it "returns an instance of Airport" do
      expect(Airport.new).to be_instance_of(Airport)
    end

    it "has the weather property set to an instance of the weather class when instantiated" do
      expect(subject.weather).to be_instance_of(Weather)
    end

    it "has a readable array of planes, initialised as empty" do
      expect(subject.planes).to eq([])
    end

    it "has a default capacity of 50" do
      expect(subject.capacity).to eq(50)
    end

    it "can have capacity set by passing an argument when instantiating" do
      expect(Airport.new(100).capacity).to eq(100)
    end
  end

  describe "#receive_plane" do
    context "weather is sunny" do
      before(:each) do
        allow_any_instance_of(Weather).to receive(:generate_weather).and_return("sunny")
      end

      it "adds a plane to the airports planes array if plane is flying" do
        subject.receive_plane(plane)
        expect(subject.planes.include?(plane)).to eq(true)
      end

      it "tells the plane to run it's own land method" do
        expect(plane).to receive(:land)
        subject.receive_plane(plane)
      end
  
      it "prints an error if the plane is not flying" do
        allow(plane).to receive(:location).and_return("not flying")
        expect { subject.receive_plane(plane) }.to output("This plane is not currently flying\n").to_stdout
      end

      it "doesn't let a plane land when the airport is full" do
        subject.capacity.times { subject.receive_plane(plane) }
        test_plane = double :plane
        subject.receive_plane(test_plane)
        expect(subject.planes.include?(test_plane)).to eq(false)
      end
  
      it "prints a warning when plane tries to land while airport is full" do
        subject.capacity.times { subject.receive_plane(plane) }
        expected_output = "Airport at maximum capacity\n"
        expect { subject.receive_plane(plane) }.to output(expected_output).to_stdout
      end
    end

    context "weather is stormy" do
      before(:each) do
        allow_any_instance_of(Weather).to receive(:generate_weather).and_return("stormy")
      end

      it "doesn't let planes land when weather is stormy" do
        airport = Airport.new
        airport.receive_plane(plane)
        expect(airport.planes).to eq([])
      end
  
      it "prints warning when planes try to land while weather is stormy" do
        airport = Airport.new
        expected_output = "Weather too dangerous to land\n"
        expect { airport.receive_plane(plane) }.to output(expected_output).to_stdout
      end
    end
  end

  describe "#release_plane" do
    before(:each) do
      allow_any_instance_of(Weather).to receive(:generate_weather).and_return("sunny")
    end

    context "weather is sunny" do
      it "removes the plane from the airport's planes array if plane is landed at the airport" do
        subject.receive_plane(plane)
        allow(plane).to receive(:location).and_return(subject)
        subject.release_plane(plane)
        expect(subject.planes).to eq([])
      end

      it "releases the correct plane if more than one is present" do
        plane2 = double(:plane)
        allow(plane).to receive(:location).and_return(subject)
        allow(plane2).to receive(:location).and_return(subject)
        subject.receive_plane(plane)
        subject.receive_plane(plane2)
        subject.release_plane(plane)
        expect(subject.planes.include?(plane)).to eq(false)
      end

      it "tells the plane to run it's own takeoff method" do
        allow(plane).to receive(:location).and_return(subject)
        expect(plane).to receive(:takeoff)
        subject.release_plane(plane)
      end
  
      it "prints an error if the plane is at a different airport" do
        airport2 = Airport.new
        subject.receive_plane(plane)
        allow(plane).to receive(:location).and_return(airport2)
        expected_output = "This plane is not at this airport\n"
        expect { subject.release_plane(plane) }.to output(expected_output).to_stdout
      end
  
      it "prints an error if the plane is already flying" do
        subject.receive_plane(plane)
        expected_output = "This plane is not at this airport\n"
        expect { subject.release_plane(plane) }.to output(expected_output).to_stdout
      end
    end

    context "weather is stormy" do
      it "doesn't let planes take off when weather is stormy" do
        airport = Airport.new
        airport.receive_plane(plane)
        allow_any_instance_of(Weather).to receive(:weather).and_return("stormy")
        airport.release_plane(plane)
        expect(airport.planes).to eq([plane])
      end

      it "prints warning when planes try to take off while weather is stormy" do
        allow_any_instance_of(Weather).to receive(:generate_weather).and_return("stormy")
        airport = Airport.new
        airport.receive_plane(plane)
        expected_output = "Weather too dangerous to take off\n"
        expect { airport.release_plane(plane) }.to output(expected_output).to_stdout
      end
    end
  end
end
