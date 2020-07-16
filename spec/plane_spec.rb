require 'plane'

describe Plane do

    it 'creates an instance of Plane' do
    my_plane = Plane.new
    expect(my_plane).to be_instance_of Plane
    end

end
