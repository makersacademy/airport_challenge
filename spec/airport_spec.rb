require 'airport'

describe Airport do
  it "Allows the user to create an instance of Airport" do
    expect(subject).to be_an_instance_of(Airport)
  end
  describe '#land' do
    it "Instances of airport respond to the land method, accepting plane as argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "airport should store the landed plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
    it "When a plane is in an airport, it will not respond to #land" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "This plane has already landed"
    end
    describe "When airport is at capacity" do
      it "Does not allow planes to land" do
        Airport::DEFAULT_CAPACITY.times { subject.land Plane.new } 
        expect { subject.land Plane.new }.to raise_error "Airport full! You cannot land here!"
      end
    end
  end
  describe '#takeoff' do
    it 'Instances of airport respond to the takeoff method' do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end
    it "airport should release the stored plane" do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      subject.takeoff(plane)
      expect(subject.planes).to_not include(plane)
    end
    # it "When it is stormy, takeoff will be prevented" do
    #   weather = Weather.new
    #   allow(subject).to receive(weather.weather).and_return("Stormy")
    #   expect(subject)
    # end
  end
  describe '#stormy?' do
    it 'Instances of airport respond to the stormy method' do
      expect(subject).to respond_to(:stormy?)
    end
    it 'Returns sunny or stormy' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
    it 'When metoffice returns stormy, takeoff is prevented' do
      allow(subject).to receive(:stormy?) {true}
      expect {subject.takeoff Plane.new}.to raise_error "Conditions are too risky to fly. Stay grounded!"
    end
  end
end
