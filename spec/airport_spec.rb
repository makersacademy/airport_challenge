require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

describe Airport do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  describe "creating a new Airport" do
    it "creates a new airport object" do
      expect(Airport.new).to be_instance_of Airport
    end
    it "has a corect custom capacity" do
      expect(Airport.new(5).capacity).to eq 5
    end
  end
  describe "#land" do
    let(:plane) { double :plane }
    it "lands a plane at an airport" do
      allow(subject.weather).to receive(:rand).and_return(1)
      subject.land(plane)
      expect(subject.hangar).to include plane
    end
    it "errors if weather is bad, not allowing a plane to land" do
      allow(subject.weather).to receive(:rand).and_return(0)
      expect { subject.land(plane) }.to raise_error "Bad weather"
    end
    it "throws an error if airport is full" do
      allow(subject.weather).to receive(:rand).and_return(1)
      subject.capacity.times  { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport is full"
    end
  end
  describe "#take_off" do
    let(:plane) { double :plane }
    it "allows specific plane to take off and confirms it took off" do
      allow(subject.weather).to receive(:rand).and_return(3)
      expect{subject.take_off(plane)}.to output("Plane: #{plane} took off\n").to_stdout
    end
    it "errors if weather is bad, not allowing a plane to take off" do
      allow(subject.weather).to receive(:rand).and_return(0)
      expect { subject.take_off(plane) }.to raise_error "Bad weather"
    end
  end
end
