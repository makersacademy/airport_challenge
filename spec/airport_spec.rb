require './lib/airport.rb'

describe Airport do
  subject(:airport) { described_class.new }

  context "#landing aircraft" do
    it "expects an airport to accept a landing aircraft" do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end
end
