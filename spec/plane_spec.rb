require 'Plane'

subject { Plane.new }


describe Plane do
    it "should instruct the plane to land at the airport" do
        expect(subject.Land(Airport.new).to eq true