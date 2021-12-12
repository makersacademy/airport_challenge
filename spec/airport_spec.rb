require 'airport'

describe Airport
    describe 'land plane' do
    it 'allows planes to land at an airport' do
        plane = Plane.new
        expect(plane.land?).to eq true
        
    end

    describe 'fly plane' do
        it 'lets plane takeoff and confirm takeoff' do
        plane = Plane.new
        expect(plane.takeoff?).to eq "Plane has left airport"
        end
    end
end