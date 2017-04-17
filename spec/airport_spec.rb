require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:aircraft) { double(:aircraft) }

  context "#landing aircraft" do
    it "Expects an airport to accept a landing aircraft" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "Has a attribute set to an instance of Plane post landing" do
      expect(airport.land(plane)).to eq airport.aircraft
    end
  end

  context "#take_off aircraft" do
    it { is_expected.to respond_to :take_off }
  end

end
