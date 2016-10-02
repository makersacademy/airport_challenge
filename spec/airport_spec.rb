require 'airport'
require 'plane'


describe Airport do
  subject(:airport) {described_class.new}
  let(:plane00) {double :plane}
  let(:weather) {double :weather}

  describe "#land" do
    it "instructs a plane to land" do
      allow(plane00).to receive(:land)
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "confirms the plane has landed" do
      subject.land(plane00)
      expect(subject.planes).to include(plane00)
    end
  end

  describe "#takeoff" do

    before(:example) do
      subject.land(plane00)
    end

    it "instructs a plane to take off" do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it "confirms the plane is not in airport" do
      subject.takeoff(plane00)
      expect(subject.planes).not_to include(plane00)
    end
  end

end
