require 'plane'
describe Plane do

  it {is_expected.to be_kind_of(Plane)}

  # it 'can create an instance of plane' do
  #   plane = Plane.new
  #   expect(plane).to be_kind_of(Plane)
  # end

  it {is_expected.to respond_to(:take_off_confirmed)}

  # it 'can confirm plane has taken off' do
  #   plane = Plane.new
  #   expect(plane).to respond_to(:take_off_confirmed)
  # end

  # it 'can respond to confirm' do
  #   plane = Plane.new
  #   plane.land
  #   plane.take_off
  #   expect(plane.take_off).to respond_to(:confirm)
  # end

end
