require 'airport'
require 'plane'

describe Airport do

    it "should be able to land" do
        plane = Plane.new
        airport = Airport.new
        expect(airport).to respond_to :land
    end

it { is_expected.to respond_to(:land).with(1).argument }

end
