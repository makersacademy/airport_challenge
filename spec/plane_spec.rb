require "plane.rb"

describe Plane do
    it 'creates an instance of the class plane' do
        plane = Plane.new
        expect(plane).to be_kind_of(Plane)
    end

end