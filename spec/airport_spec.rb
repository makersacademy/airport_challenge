require 'airport'

describe Airport do
  let(:plane) { double(:takeoff => nil, :land => nil, :location => "flying") }
  
  describe "creating a new airport" do
    it "returns an instance of Airport" do
      expect(Airport.new).to be_instance_of(Airport)
    end

    it "has an accessible weather property" do
      expect(subject).to respond_to(:weather)
    end

    it "has the weather property set to either stormy or sunny when instantiated" do
      weather_options = ["sunny", "stormy"]
      expect(weather_options.include?(subject.weather)).to eq(true)
    end

    it "has a readable array of planes, initialised as empty" do
      expect(subject.planes).to eq([])
    end

    it "has a readable capacity property" do
      expect(subject).to respond_to(:capacity)
    end

    it "has a default capacity of 50" do
      expect(subject.capacity).to eq(50)
    end

    it "can have capacity set by passing an argument when instantiating" do
      expect(Airport.new(100).capacity).to eq(100)
    end
  end

  describe "#generate_weather" do
    it "returns either sunny or stormy" do
      weather_options = ["sunny", "stormy"]
      expect(weather_options.include?(subject.generate_weather)).to eq(true)
    end

    it "returns stormy if random number generator returns 5" do
      allow(subject).to receive(:rand).and_return(5)
      expect(subject.generate_weather).to eq("stormy")
    end

    it "returns sunny if random number generator returns 1-4" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.generate_weather).to eq("sunny")
    end

    it "returns sunny if random number generator returns 1-4" do
      allow(subject).to receive(:rand).and_return(4)
      expect(subject.generate_weather).to eq("sunny")
    end
  end

  describe "#receive_plane" do
    before(:each) do
      allow_any_instance_of(Airport).to receive(:generate_weather).and_return("sunny")
    end

    it "adds a plane to the airports planes array if plane is flying" do
      subject.receive_plane(plane)
      expect(subject.planes.include?(plane)).to eq(true)
    end

    it "prints an error if the plane is not flying" do
      allow(plane).to receive(:location).and_return("not flying")
      expect { subject.receive_plane(plane) }.to output("This plane is not currently flying\n").to_stdout
    end

    it "doesn't let planes land when weather is stormy" do
      allow_any_instance_of(Airport).to receive(:generate_weather).and_return("stormy")
      airport = Airport.new
      airport.receive_plane(plane)
      expect(airport.planes).to eq([])
    end

    it "prints warning when planes try to land while weather is stormy" do
      allow_any_instance_of(Airport).to receive(:generate_weather).and_return("stormy")
      airport = Airport.new
      expect { airport.receive_plane(plane) }.to output("Weather too dangerous to land\n").to_stdout
    end

    it "doesn't let a plane land when the airport is full" do
      subject.capacity.times { subject.receive_plane(plane) }
      test_plane = double :plane
      subject.receive_plane(test_plane)
      expect(subject.planes.include?(test_plane)).to eq(false)
    end

    it "prints a warning when plane tries to land while airport is full" do
      subject.capacity.times { subject.receive_plane(plane) }
      expect { subject.receive_plane(plane) }.to output("Airport at maximum capacity\n").to_stdout
    end
  end

  describe "#release_plane" do
    before(:each) do
      allow_any_instance_of(Airport).to receive(:generate_weather).and_return("sunny")
    end

    it "removes the plane from the airport's planes array if plane is landed at the airport" do
      subject.receive_plane(plane)
      allow(plane).to receive(:location).and_return(subject)
      subject.release_plane(plane)
      expect(subject.planes).to eq([])
    end

    it "prints an error if the plane is at a different airport" do
      airport2 = Airport.new
      subject.receive_plane(plane)
      allow(plane).to receive(:location).and_return(airport2)
      expect { subject.release_plane(plane) }.to output("This plane is not at this airport\n").to_stdout
    end

    it "prints an error if the plane is already flying" do
      subject.receive_plane(plane)
      expect { subject.release_plane(plane) }.to output("This plane is not at this airport\n").to_stdout
    end

    it "doesn't let planes take off when weather is stormy" do
      airport = Airport.new
      allow(airport).to receive(:weather).and_return("sunny")
      airport.receive_plane(plane)
      allow(airport).to receive(:weather).and_return("stormy")
      airport.release_plane(plane)
      expect(airport.planes).to eq([plane])
    end

    it "prints warning when planes try to take off while weather is stormy" do
      allow_any_instance_of(Airport).to receive(:generate_weather).and_return("stormy")
      airport = Airport.new
      airport.receive_plane(plane)
      expect { airport.release_plane(plane) }.to output("Weather too dangerous to take off\n").to_stdout
    end
  end
end
