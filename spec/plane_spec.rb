require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it 'respond to landed' do
    expect(plane).to respond_to(:landed)
  end

  it 'respond to taken_off' do
    expect(plane).to respond_to(:taken_off)
  end

  it 'respond to in_airport?' do
    expect(plane).to respond_to(:in_airport?)
  end

  it 'method in_airport? should return false after take_off and true after land has been called' do
    plane.taken_off
    expect(plane.in_airport?).to eq false
    plane.landed
    expect(plane.in_airport?).to eq true
  end

end
