require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  describe 'landing planes' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands planes that are not already landed' do
      landed_plane = airport.land(:plane)
      expect(landed_plane).not_to be_landed
    end
  end

  describe 'planes taking off' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
  end

end
