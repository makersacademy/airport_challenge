require 'airport'

describe Airport do

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'logs one plane has landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
  end

end
