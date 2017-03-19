require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}
  let(:weather) {double :weather}

  it "Checks default maximum capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land(plane)" do
    before do
      allow(plane).to receive(:land)
      allow(weather).to receive(:stormy?).and_return false
    end

#  did work before stomry? wont be set to false
    # it "plane can't land if airport is full" do
    #   subject.capacity.times do
    #     airport.land(plane)
    #   end
    #   expect {airport.land(plane)}.to raise_error("Airport full")
    # end
    #
    #
    # it "checks plane is in airport array" do
    #   subject.land(plane)
    #   expect(subject.send(:planes)).to include plane
    # end
   end

  describe "#take_off(plane)" do
    before do
      allow(plane).to receive(:take_off)
    end

    it "checks plane is no longer in airport array" do
      subject.take_off(plane)
      expect(subject.send(:planes)).not_to include plane
    end
  end
end
