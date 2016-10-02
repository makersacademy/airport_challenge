require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  describe "#land" do
    it "instructs a plane to land" do
      allow(plane).to receive(:land)
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "confirms the plane has landed" do
      subject.land(plane)
      expect(subject.planes).to include(plane)
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

  it "doesn't accept new plane when full" do
    error = "Airport is full"
    30.times {subject.land(plane)}
    expect{subject.land(plane)}.to raise_error error
  end

end
