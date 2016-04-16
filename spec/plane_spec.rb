require 'plane'

describe Plane do

  let(:plane) {described_class.new}

    it 'can take off' do
      expect(plane.take_off).to be_flying
    end

    it 'raises error if already flying when take off' do
      plane.take_off
      expect{plane.take_off}.to raise_error "Plane is already flying"
    end

    it 'can land' do
      plane.take_off
      expect(plane.land).not_to be_flying
    end

    it 'raises error if already landed when land' do
      expect{plane.land}.to raise_error "Plane is not flying"
    end

    it 'expect plane not to be flying as default' do
      expect(plane).not_to be_flying
    end

end