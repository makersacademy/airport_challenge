require 'plane'

describe Plane do
  it { is_expected.to respond_to(:landed) }
  it { is_expected.to respond_to(:flying) }

  it 'custom landed' do
    plane = Plane.new
    plane.landed = true
    expect(plane.landed).to eq true
  end

  it 'custom landed' do
    plane = Plane.new
    plane.flying = true
    expect(plane.flying).to eq true
  end
end
