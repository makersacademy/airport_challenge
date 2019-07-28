require 'plane'

describe Plane do
    it 'by default is created on the land' do 
        expect(Plane.new.departed).to eq(false)
    end

    describe 'land' do
        it 'can only land if its currently taken-off' do 
            ba_plane = Plane.new
            ba_plane.departed = true

            expect(ba_plane.land).to eq true
        end 

        it 'when landed changes departed to false' do
            ba_plane = Plane.new
            ba_plane.departed = true
            ba_plane.land

            expect(ba_plane.departed).to eq false
        end

        it 'cannot land if its currently on land' do 
            ba_plane = Plane.new 
            allow(ba_plane).to receive(:departed).and_return(false)
            
            expect(ba_plane.land).to eq false
        end
    end

    describe 'takeoff' do
        it 'returns either true or false' do 
            expect(Plane.new.takeoff).to eq(true).or eq(false)
        end
    end
end
