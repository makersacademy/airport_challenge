require 'airport'
require 'plane'

RSpec.describe Airport do
    it { should respond_to(:land_plane) }
    it { should respond_to(:take_off_plane) }

    subject {Airport.new}

    describe 'initialize' do

        it 'Sets default capacity to 20 planes' do
            expect(subject.capacity).to eq 20
        end

        it 'Takes a given capacity' do
            airport = Airport.new(40)
            expect(airport.capacity).to eq 40
        end

    end

    describe 'land_plane' do
        let(:plane) {double(:id => 1)}

        it 'Allows a plane to land if there is space in the hangar and weather is not stormy and prints landing message' do
            allow(subject.weather).to receive(:rand).and_return(10)
            expect(subject.land_plane(plane)).to eq "Plane: 1, has landed."
        end

        it 'Rejects a landing request if weather is stormy, regardless of hangar space' do
            allow(subject.weather).to receive(:rand).and_return(1)
            expect(subject.land_plane(plane)).to eq "Landing request rejected due to ongoing storm."
        end

        it 'Rejects a landing request if the hangar is full' do
            allow(subject.weather).to receive(:rand).and_return(10)
            20.times { subject.land_plane(plane) }
            expect(subject.land_plane(plane)).to eq "Landing request rejected due to hangar being full."
        end

    end

    describe 'take_off_plane' do
        let(:planeD) {double(:id => 1)}

        it 'Allows a plane to take off if the weather is not stormy' do
            allow(subject.weather).to receive(:rand).and_return(10)
            subject.land_plane(planeD)
            expect(subject.take_off_plane(planeD)).to eq "Plane: 1, has taken off."
        end

        it 'Rejects a take-off request when weather is stormy' do
            allow(subject.weather).to receive(:rand).and_return(10)
            subject.land_plane(planeD)
            allow(subject.weather).to receive(:rand).and_return(1)
            expect(subject.take_off_plane(planeD)).to eq "Take-off request rejected due to ongoing storm."
        end

        it 'Rejects take-off request if plane is not in the hangar' do
            expect(subject.take_off_plane(planeD)).to eq "This plane is not in the hangar."
        end

    end

    describe 'feature test' do
        it 'Allows us to land and take off any combination of planes' do
            allow(subject.weather).to receive(:rand).and_return(12)
            5.times { subject.land_plane(Plane.new) }
            2.times { subject.take_off_plane(subject.hangar.last) }
            expect(subject.hangar.length).to eql 3
        end

    end

end
