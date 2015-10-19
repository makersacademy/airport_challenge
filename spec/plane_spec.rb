require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'changes its status to true after landing' do
    plane.land
    expect(plane.flying).to eq false
  end

  it 'changes its status to true after taking off' do
    plane.land
    plane.take_off
    expect(plane.taken_off?).to eq true
  end

  it 'cannot take off if the plane is flying' do
    expect{ plane.take_off }.to raise_error 'You are already flying'
  end

  it 'cannot land if the plane is not flying' do
    plane.land
    expect{ plane.land }.to raise_error 'You are not flying'
  end
end
