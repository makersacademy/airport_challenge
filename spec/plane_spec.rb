require "plane"
require "airport"
require "weather"

describe Plane do
    subject(:plane_grounded) { described_class.new }
    subject(:plane_flying) { described_class.new("B",true) }
    let(:airport) { Airport.new }
    
    describe "tests:" do
        before do
            allow(airport.weather).to receive(:stormy?).and_return false
        end

        it {is_expected.to respond_to(:flying?)}
        
        it "should be considered landed once landed" do
            airport.land(plane_flying)
            expect(plane_flying.flying?).to eq(false)
        end

        it "should be considered flying once taken off" do
            airport.add_plane(plane_grounded)
            airport.take_off(plane_grounded)
            expect(plane_grounded.flying?).to eq(true)
        end

    end



end

    