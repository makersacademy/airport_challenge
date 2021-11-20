require 'airport'
require 'plane'

describe Airport do

    it { is_expected.to respond_to :land_plane }

    it { is_expected.to respond_to :plane_take_off }

    describe "#plane_take_off" do
        it "should confirm the plane is no longer in the airport" do
            expect(Airport.new.plane_take_off).to eq("The plane is no longer in the airport")
        end
    end
end