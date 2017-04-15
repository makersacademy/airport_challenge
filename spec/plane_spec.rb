require 'plane'

describe 'plane' do
  plane = Plane.new
  it 'tests whether an instance of plane responds to land method' do
    expect(plane).to respond_to :land
  end

  # it 'tests whether a plane has truly landed' do
  #   expect(Plane.new.land). to be_truthy
  # end

  it 'tests whether a landed plan has been added to the array' do
    plane.land(plane)
    expect($planes_landed). to include(plane)
  end
end
