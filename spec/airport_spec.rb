require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

describe Airport do
  it { is_expected.to respond_to(:land) }

  describe "creating a new Airport" do
    it "creates a new airport object" do
      expect(Airport.new).to be_instance_of Airport
    end
  end
  describe "#land" do
    let(:plane) { double :plane }
    it "lands a plane at an airport" do
      subject.land(plane)
      expect(subject.hangar).to include plane
    end
  end
end
