require 'airport'

describe Airport do

  it { is_expected.to respond_to(:lands_plane).with(1).argument }

  describe '#lands_plane' do

    it { is_expected.to eq "The plane has landed!" }

  end

end
