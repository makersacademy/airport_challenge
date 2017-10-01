require 'plane'
require 'airport'
describe Airport do
  let(:plane) { Plane.new }
  subject { Airport.new }
  it "expects to tell whether landing and taking_off is blocked or not " do
    expect(subject.blocked_airport).to eq false
  end
  describe "#prevent_landing" do
    it "expects to prevents any landing in the airport" do
      subject.prevent_landing = true
      expect { plane.land(subject) }.to raise_error(RuntimeError, "no landing because of stormy weather")
    end
  end
  describe "#prevent_take_off" do
    it "expects to prevents any take_off in the airport" do
      subject.prevent_take_off = true
      expect { plane.take_off(subject) }.to raise_error(RuntimeError, "no take_off because of stormy weather")
    end
  end
end
