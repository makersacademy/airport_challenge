require 'plane'

describe Plane do
  it 'is plane flying, yes' do
    plane = Plane.new
    plane.to_air
    expect(plane.flying?).to eq true
  end

  it 'is plane flying, no' do
    plane = Plane.new
    plane.to_ground
    expect(plane.flying?).to eq false
  end
end
