require 'plane'
require 'airport'
describe Airport do
  let(:plane) { Plane.new("Paradise Airport") }
  subject { Airport.new("Paradise Airport") }
  it "expects to tell whether landing and taking_off is blocked or not " do
    expect(subject.blocked_airport).to eq false
  end
  describe "#name" do
    it "expects to have a name attribute (String) when an Airport object is instantiated" do
      expect(subject.name).to be_a_kind_of(String)
    end
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
