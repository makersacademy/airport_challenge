require 'airport'
require 'plane'

describe Airport do

describe '#land_plane' do
    it { should respond_to (:land_plane) }

    it 'Should allow a plane to land' do
        plane = Plane.new
        expect(subject.land_plane(plane)).to eq plane
    end
end

describe '#take_off' do
    it { should respond_to (:take_off) }

    it 'Should allow plane to take off and is confirmed to have left the airport' do 
        plane = Plane.new
        subject.land_plane(plane)
        expect(subject.take_off).to eq plane
        expect(plane.at_airport?).to eq false
    end
end

describe '#check_capacity' do
    it { should respond_to (:take_off) }

    it 'Should prevent landing if airport is full'
    
    expect()
end