require 'plane'

describe Plane do

  it 'is actually a real Plane' do
    expect { Plane.new }.to_not raise_error
  end

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to(:land).with(1).argument }

end
