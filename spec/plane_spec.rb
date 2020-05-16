require_relative '../lib/plane.rb'

describe Plane do
  let(:plane) {Plane.new}
  describe '#land_at(airport)' do
    it "should be at the airport it landed at" do ## update test when airport class is created
      plane.land_at("airport")
      expect(plane.location).to eq("airport")
    end
  end
  describe '#takeoff_from(airport)' do
    it "should leave airport and begin flying" do
      plane.land_at("airport")
      plane.takeoff_from("airport")
      expect(plane.location).to eq("air")
    end
  end 
end
