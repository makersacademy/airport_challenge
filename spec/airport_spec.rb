require 'airport'

describe Airport do

  describe 'take off' do
    it { is_expected.to respond_to :release_plane }


  end

  describe 'landing' do
    it { is_expected.to respond_to(:land).with(1).argument }

  end


end
