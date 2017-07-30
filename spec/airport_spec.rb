require 'airport'

describe Airport do

  subject(:airport) {described_class.new}

  describe '#land_plane' do
    it 'instructs plane to land' do
      expect(airport).to respond_to(:land_plane).with(1).argument
    end
  end

  describe '#take_off' do
    it 'instructs plane to take-off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
