require_relative '../lib/plane.rb'

describe Plane do ## update test when airport class is created

  let(:plane) { Plane.new }

  describe '#land_at(airport)' do
    it "should be at the airport it landed at," do
      plane.land_at("airport")
      expect(plane.location).to eq("airport")
    end
    it "and tell the operator that it landed" do
      expect { plane.land_at("airport").to
        output("landed at #{airport}\n").to_stdout }
    end
    it "should only be able to land if it is flying, " do
      plane.land_at("airportA")
      plane.land_at("airportB")
      expect(plane.location).to eq("airportA")
    end
    it "and tell the operator of the problem" do
      plane.land_at("airportA")
      expect { plane.land_at("airportB").to
        output("currently located at airportA so can not land\n").to_stdout }
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
