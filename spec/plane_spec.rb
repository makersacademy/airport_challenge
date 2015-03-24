require 'plane'
require 'airport'

describe Plane do

  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane).to be_fly
  end

  it 'has a flying status when in the air' do
    plane.fly
    expect(plane.status).to eq 'flying'
  end

  it 'can take off' do
    plane.takeoff_order
    expect(plane).to be_fly
  end

  it 'have landed status when on the ground' do
    plane.land
    expect(plane.status).to eq 'landed'
  end
end
