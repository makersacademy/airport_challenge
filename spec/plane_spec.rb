require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it 'respond to landed' do
    expect(plane).to respond_to(:land)
  end

  it 'respond to taken_off' do
    expect(plane).to respond_to(:take_off)
  end

  it 'respond to in_airport?' do
    expect(plane).to respond_to(:status?)
  end

  it 'method in_airport? should return false after take_off and true after land has been called' do
    plane.take_off
    expect(plane.status?).to eq "Flying"
    plane.land
    expect(plane.status?).to eq "In Airport"
  end

end
