require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  subject(:plane) { double(:plane) }
  subject(:aircraft) { double(:aircraft) }

  context "#landing aircraft" do
    it "expects an airport to accept a landing aircraft" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "has a attribute set to an instance of Plane post landing" do
      expect(airport.land(plane)).to eq airport.aircraft
    end

  end
end
