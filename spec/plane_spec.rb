require 'plane'
require 'airport'

describe Plane do
    let(:plane) { Plane.new } 
    let(:land) { Airport.new }
    describe "#plane" do
    it { is_expected.to respond_to :at_airport }

    it "should determine if a plane is at an airport" do
        expect(plane.at_airport).to eq true
    end

    it "should tell a plane to land at an airport" do
      expect(plane).to respond_to(:plane)
    end
    it "should raise an error if weather is stormy" do
        expect { plane.plane(land) }.to raise_error "Weather stormy, unable to land"
        end
end
end