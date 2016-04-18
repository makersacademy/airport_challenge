require 'plane'

describe Plane do

  let(:plane) {subject}

  it {is_expected.to be_flying}

  describe '#land' do

    it 'land a flying plane' do
      plane.land
      expect(plane).not_to be_flying
    end

    it 'cannot land a landed plane' do
      plane.land
      expect{plane.land}.to raise_error 'Plane already landed!'
    end
  end

  describe '#take_off' do

    it 'make a landed plane take off' do
      plane.land
      plane.take_off
      expect(plane).to be_flying
    end

    it 'cannot make a flying plane take off' do
      expect{plane.take_off}.to raise_error 'Plane already flying!'
    end

  end

end