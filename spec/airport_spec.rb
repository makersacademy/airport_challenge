require 'airport'

describe Airport do
  it { is_expected.to respond_to :land_plane }
    it { is_expected.to respond_to :take_off }

    it { is_expected.to respond_to (:take_off).with(1)argument }
    it { is_expected.to respond_to (:plane) }
  end 
