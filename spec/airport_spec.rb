require 'airport'

describe Airport do

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'check if plane has landed' do
      plane = Plane.new
      expect(subject.land(plane)).to include plane
    end
  end

end
