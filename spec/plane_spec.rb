require 'plane'

describe 'Plane' do
    it 'has a class called plane' do
        expect(plane = Plane.new).to be_an_instance_of(Plane)
    end
end 