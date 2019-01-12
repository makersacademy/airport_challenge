require 'airport'

RSpec.describe Airport do

  it 'Airport allows plane to land' do
    gatwick = Airport.new
    plane = Plane.new
    expect(gatwick.land(plane)).to eq([plane])
  end

  it 'Airport allows plane to take off' do
    gatwick = Airport.new
    plane = Plane.new
    expect(gatwick.take_off).to eq('Plane no longer in the airport')
  end


end
