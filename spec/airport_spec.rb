require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  it "Checks default maximum capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land(plane)" do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed)
    end

#  did work before stormy?, won't always be set to false
    it "plane can't land if airport is full" do
      allow(subject.weather).to receive(:weather?).and_return(false)
      subject.capacity.times do
        airport.land(plane)
      end
      expect {airport.land(plane2)}.to raise_error("Airport full")
    end


    it "checks plane is in airport array" do
      allow(subject.weather).to receive(:weather?).and_return(false)
      subject.land(plane)
      expect(subject.send(:planes)).to include plane
    end
  end

  describe "#take_off(plane)" do
    before do
      allow(plane).to receive(:take_off)
      allow(plane).to receive(:in_transit)
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed)
    end

    it "checks plane is no longer in airport array" do
      allow(subject.weather).to receive(:weather?).and_return(false)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.send(:planes)).not_to include plane
    end
  end
end
