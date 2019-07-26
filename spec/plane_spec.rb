
require_relative '../lib/plane.rb'

describe Plane do
  it 'Checks that an instance of the plane class can be created and is actually an instance of the plan class' do
    new_plane = Plane.new
    expect( new_plane).to be_kind_of(Plane)
  end

  it 'Checks that the plane can land at the airport' do
    new_plane = Plane.new
    expect( new_plane).to respond_to(:land)
  end

end



