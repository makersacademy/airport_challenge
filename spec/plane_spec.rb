require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it 'respond to landed' do
    expect(plane).to respond_to(:land)
  end

  it 'respond to taken_off' do
    expect(plane).to respond_to(:take_off)
  end

  it 'method status should return "Flying" after take_off and "In Airport" after land has been called' do
    expect(plane).to respond_to(:status)
    plane.take_off
    expect(plane.status).to eq "Flying"
    plane.land
    expect(plane.status).to eq "In Airport"
  end

end
