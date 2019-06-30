require 'plane'
describe Plane do
  let(heathrow) { double :airport}
  describe '#land' do
    it "should land if safe to do so and store in airport instance" do

      expect(subject.safe?(true).land(heathrow).status).to output("Landed safely at LHR").to_stdout
    end
    it "should return 'Not safe to land in this weather' if unsafe" do

      expect(subject.safe?(false).land(heathrow)).to output("Not safe to land in this weather").to_stdout
    end
    it "should return 'Airport is full' if at capacity" do

      expect(subject.land(heathrow).status).to output("Airport is full, cannot land").to_stdout
    end
  end
  describe '#take_off' do
    it "should take off if weather is fine" do

    end
    it "should return 'Not safe to fly' if the weather isn't safe" do

    end
  end
end
