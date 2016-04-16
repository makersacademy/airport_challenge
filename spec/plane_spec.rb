require 'plane'

describe Plane do

  let(:plane) {described_class.new}

    it 'responds to is flying?' do
      expect(plane).to respond_to :flying?
    end

    it 'responds to land' do
      expect(plane).to respond_to :land
    end

    it 'responds to take_off' do
      expect(plane).to respond_to :take_off
    end

    it 'returns true if plane is flying' do
      expect(plane.take_off).to be_flying
    end

    it 'returns false if plane isn\'t flying' do
      expect(plane.land).not_to be_flying
    end

    it 'expect plane not to be flying as default' do
      expect(plane).not_to be_flying
    end

end