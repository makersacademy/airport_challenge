require './lib/plane'

describe Plane do

  it 'can create a plane' do
    expect(Plane.new).to be_a Plane
  end

  it 'can land a plane to a given airport' do
    expect(Plane.new).to respond_to(:land).with(1).argument
  end

  it 'can instruct a plane to take off from an airport' do
    expect(Plane.new).to respond_to(:take_off).with(1).argument
  end
end
