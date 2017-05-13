require 'airport'

describe Airport do
  describe '#lands_planes' do
    it { is_expected.to respond_to(:lands_plane).with(1).argument }

  end
end
