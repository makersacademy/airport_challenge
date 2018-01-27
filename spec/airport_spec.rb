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

end
