require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}
  let(:weather) {Weather.new}


  describe "#land" do

    it "instructs a plane to land" do
      allow(plane).to receive(:land)
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "confirms the plane has landed" do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    context "when the weather is stormy" do
      it "prevents plane from landing with exceptions" do
        allow(weather).to receive(:stormy?) {true}
        expect{subject.land(plane)}.to raise_error "No landing, it's too stormy!"
      end
    end
  end

  describe "#takeoff" do

    before(:example) do
      subject.land(plane)
    end

    it "instructs a plane to take off" do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it "confirms the plane is not in airport" do
      subject.takeoff(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  describe "capacity" do
    error = "Airport is full"

    it "doesn't accept new plane when full" do
      subject.capacity.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error error
    end

    it "allows default capacity to be override" do
      airport = Airport.new(40)
      40.times {airport.land(plane)}
      expect {airport.land(plane)}.to raise_error error
    end

  end

end
