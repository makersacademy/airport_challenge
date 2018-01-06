require 'airport'

describe Airport do

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'plane lands' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'raises an error when plane takes off' do
      plane = Plane.new
      expect{subject.take_off(plane)}.to raise_error("The plane is no longer in the airport")
    end
  end
end
