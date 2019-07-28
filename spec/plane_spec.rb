require 'plane'

describe Plane do
    it 'by default is created on the land' do 
        expect(Plane.new.can_takeoff).to eq(true)
        expect(Plane.new.can_land).to eq(false)
    end

    describe 'land' do
        it 'can only land if its currently taken-off' do 
            ba_plane = Plane.new
            ba_plane.can_land = true

            expect(ba_plane.land).to eq true
        end 

        it 'when landed changes can_land to false' do
            ba_plane = Plane.new
            ba_plane.can_land = true
            ba_plane.land

            expect(ba_plane.can_land).to eq false
        end

        it 'when landed changes can_takeoff to true' do
            ba_plane = Plane.new
            ba_plane.can_land = true
            ba_plane.land

            expect(ba_plane.can_takeoff).to eq true
        end

        it 'cannot land if its currently on land' do 
            ba_plane = Plane.new 
            allow(ba_plane).to receive(:can_land).and_return(false)
            
            expect(ba_plane.land).to eq false
        end
    end

    describe 'takeoff' do
        it 'returns either true or false' do 
            expect(Plane.new.takeoff).to eq(true).or eq(false)
        end
    end
end
