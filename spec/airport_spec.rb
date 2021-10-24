require "airport"

describe Airport do
  subject(:airport) { described_class.new(30) }

  describe "#land" do
    it "lands at an airport" do
    expect(airport).to respond_to(:land).with(1).argument
    end
    it "not allow landing when capacity is full" do
        30.times do
            airport.land(:plane)
        end
        expect { airport.land(:plane).to raise_error "Cannot land, airport is full!!"}
      end
  end
  describe "#take_off" do
    it "take off from an airport and confirm that it is no longer in the airport" do
    expect(airport).to respond_to(:take_off).with(1).argument
    end
end
end
