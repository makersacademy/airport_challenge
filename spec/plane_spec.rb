require 'plane'
describe Plane do

  it {is_expected.to be_kind_of(Plane)}

  # it 'can create an instance of plane' do
  #   plane = Plane.new
  #   expect(plane).to be_kind_of(Plane)
  # end

  it {is_expected.to respond_to(:land)}

  # it 'responds to land' do
  #   plane = Plane.new
  #   expect(plane).to respond_to(:land)
  # end

end
