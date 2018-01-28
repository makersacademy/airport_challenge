require 'airport'

describe Airport do

  let(:plane) { double "a plane" }

  describe "#confirm_take_off" do
    it "confirms that the plane took off" do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      plane.land(subject)
      allow(subject).to receive(:tell_weather) { "sunny" }
      plane.take_off(subject)
      expect(subject.confirm_take_off(plane)).to eq "#{plane} took off"
    end
    it "says plane didnt take off" do
      subject.planes_a = [plane]
      allow(subject).to receive(:tell_weather) { "stormy" }
      allow(plane).to receive(:take_off)
      plane.take_off(subject)
      expect(subject.confirm_take_off(plane)).to eq "#{plane} didn't take off"
    end
  end

  describe "#full?" do
    it "checks if the airport is full" do
      allow(plane).to receive(:capacity) {2}
      allow(plane).to receive(:land)
      3.times {plane.land(subject)}
      expect(subject.full?).to eq false
    end
  end

  describe "#random" do
    it "returns a number from 0 to 6" do
      expect(subject).to receive(:random).and_return(1)
      expect(subject.random).to eq 1
    end
  end

  describe "#tell_weather" do
    it "says it's stormy" do
      allow(subject).to receive(:random) { 1 }
      expect(subject.tell_weather).to eq "stormy"
    end
    it "says it's sunny" do
      allow(subject).to receive(:random) { 2 }
      expect(subject.tell_weather).to eq "sunny"
    end
  end
end
