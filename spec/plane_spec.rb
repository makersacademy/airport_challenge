require 'plane'

describe Plane do
  it 'is plane flying, yes' do
    plane = Plane.new
    plane.in_flight
    expect(plane.flying?).to eq true
  end

  it 'is plane flying, no' do
    plane = Plane.new
    plane.grounded
    expect(plane.flying?).to eq false
  end
end
