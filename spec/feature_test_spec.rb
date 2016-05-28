require 'plane'
require 'airport'

describe 'Feature test' do
  it 'works' do
    gatwick = Airport.new
    seahawk = Plane.new
    seahawk.land_at(gatwick) #plane lands at airport
    expect(gatwick.check_for_landed(seahawk)).to eq true # plane should be at airport
    seahawk.take_off_from(gatwick) #plane takes off from aiport
    expect(gatwick.check_for_landed(seahawk)).to eq false #plane should not be at airport
  end
end
