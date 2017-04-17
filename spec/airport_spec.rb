require './lib/airport.rb'
require_relative '../lib/plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:aircraft) { double(:aircraft) }

  context "#accept_aircraft" do
    it "Expects an airport to accept a landing aircraft" do
      expect(airport).to respond_to(:accept_aircraft).with(1).argument
    end

    it "Has a attribute set to an instance of Plane post landing" do
      expect(airport.accept_aircraft(plane)).to eq airport.aircraft
    end
  end

  context "#release_aircraft" do
    it { is_expected.to respond_to :release_aircraft }

    it "Removes #take_off object from attribute" do
      airport.accept_aircraft(plane)
      airport.release_aircraft
      expect(airport.aircraft).to eq nil
    end
  end

end
