require_relative '../lib/plane.rb'

describe Plane do
  let(:plane) { Plane.new }
  describe '#land_at(airport)' do
    it "should be at the airport it landed at" do ## update test when airport class is created
      plane.land_at("airport")
      expect(plane.location).to eq("airport")
    end
    it "should only be able to land if it is flying,
     and tell the operator of the problem" do
      plane.land_at("airportA")
      expect { plane.land_at("airportB").to output("currently located at airportA so can not land\n").to_stdout }
      expect(plane.location).to eq("airportA")
    end
  end
  describe '#takeoff_from(airport)' do
    it "should leave airport and begin flying" do
      plane.land_at("airport")
      plane.takeoff_from("airport")
      expect(plane.location).to eq("air")
    end
    it "shouldn't takeoff from somewhere it is not" do
      plane.land_at("airportA")
      plane.takeoff_from("airportB")
      expect(plane.location).to eq("airportA")
    end
  end
end
