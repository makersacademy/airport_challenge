require 'plane'

describe Plane do

  subject(:plane) {described_class.new}

  before do
    plane.take_off
  end

  it 'can take off' do
    expect(plane).to be_flying
  end

  it 'raises error if already flying when take off' do
    expect{plane.take_off}.to raise_error 'Plane is already flying'
  end

  it 'can land' do
    plane.land
    expect(plane).not_to be_flying
  end

  it 'raises error if already landed when land' do
    plane.land
    expect{plane.land}.to raise_error 'Plane is not flying'
  end

end