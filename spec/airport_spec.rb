require "airport"
require "plane"

describe Airport do
  airport = Airport.new
    it "expect planes to be empty" do
      expect(airport.planes).to eq []
      end
    end


describe 'Land plane' do
  airport = Airport.new
  plane = Plane.new
    it 'should allow a plane to land' do
      expect(airport.land(plane)).to eq [plane]
      end
    end
