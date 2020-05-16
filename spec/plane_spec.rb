require_relative '../lib/plane.rb'

describe Plane do ## update test when airport class is created

  let(:plane) { Plane.new }

  describe '#land_at(airport)' do
    it "should be at the airport it landed at,and tell the operator that it landed" do
      expect { plane.land_at("airport") }.to output("landed at airport\n").to_stdout
    end
    it "should only be able to land if it is flying, and tell the operator about the problem" do
      plane.land_at("airportA")
      expect { plane.land_at("airportB") }.to output("currently located at airportA so can not land\n").to_stdout
    end
  end

  describe '#takeoff_from(airport)' do
    it "should leave airport and begin flying, and tell the operator it departed" do
      plane.land_at("airport")
      expect { plane.takeoff_from("airport") }.to output("departed airport\n").to_stdout
    end
    it "shouldn't takeoff from somewhere it is not, and tell the operator about the problem" do
      plane.land_at("airportA")
      expect { plane.takeoff_from("airportB") }.to output("currently located at airportA so can not takeoff\n").to_stdout
    end
  end
end
