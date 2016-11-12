require 'plane'

describe Plane do

  subject(:plane) {described_class.new}

  it 'should be able to land' do
    expect(plane.land).to eq true
  end

  it 'should be able to take off' do
    plane.take_off
    expect(plane.landed).to eq false
  end

end
