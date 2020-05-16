require_relative '../lib/plane.rb'

describe Plane do
  let(:plane) {Plane.new}
  describe '#land_at(airport)' do
    it "should respond to" do
      expect(plane).to respond_to(:land_at).with(1).argument
    end
    it "should be at the airport it landed at" do ## update test when airport class is created
      plane.land_at("airport")
      expect(plane.location).to eq("airport")
    end
  end
end
