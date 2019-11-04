require "./lib/airport.rb"
describe Plane do
  it 'makes an instance of the plane class' do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end

  it 'land_plane method respondes to plane class' do
    plane = Plane.new
    expect(plane).to respond_to(:land_plane)
  end

  it 'lands plane' do
    plane = Plane.new
    expect(plane.land_plane).to eql(land)
  end
end
