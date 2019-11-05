require 'airport'
describe Airport do

  it {is_expected.to be_kind_of(Airport)}

  # it 'can create and instance of an airport' do
  #   airport = Airport.new
  #   expect(airport).to be_kind_of(Airport)
  # end

  it {is_expected.to respond_to(:plane_lands)}

  # it 'can respond to plane_lands' do
  #   airport = Airport.new
  #   expect(airport).to respond_to(:plane_lands)
  # end

  # it 'can land a plane' do
  #   plane = subject.plane_lands
  #   expect(plane).to be_landed
  # end

  it {is_expected.to respond_to(:plane_takes_off)}

  # it 'can respond to plane takes off' do
  #   airport = Airport.new
  #   expect(airport).to respond_to(:plane_takes_off)
  # end

  # it 'can confirm plane has taken off' do
  #   airport = Airport.new
  #   airport.plane_takes_off
  #   expect(airport.plane_takes_off).to respond_to(:take_off_confirmed)
  # end

end
