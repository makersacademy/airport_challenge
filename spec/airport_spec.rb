require 'airport'

describe Airport do

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'logs one plane has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to include plane
    end

    it 'logs a second plane has landed' do
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      subject.land(plane2)
      expect(subject.hangar).to include plane2

    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
  end

end
