require 'plane'

describe Plane do
  # p described_class
  # subject(:airport) { described_class.new}

  it 'responds to #plane_land' do

    expect(subject).to respond_to(:plane_land)
  end

  it 'responds to #plane_take_off' do
    expect(subject).to respond_to(:plane_take_off)
  end


end
