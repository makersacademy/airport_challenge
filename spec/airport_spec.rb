require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#hangar?' do
    it { is_expected.to respond_to(:hangar?).with(1).argument }
  
    it 'plane never landed in airport' do
      plane = Plane.new
      expect(subject.hangar?(plane)).to be false
    end

    it 'plane landed in airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar?(plane)).to be true
    end

    it 'plane landed then took off from airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar?(plane)).to be false
    end

    it 'different plane landed in airport' do
      plane_one = Plane.new
      plane_two = Plane.new
      subject.land(plane_one)
      expect(subject.hangar?(plane_two)).to be false
    end

    it 'both planes landed in airport' do
      plane_one = Plane.new
      plane_two = Plane.new
      subject.land(plane_one)
      subject.land(plane_two)
      expect(subject.hangar?(plane_one)).to be true
    end

    it 'both planes landed in airport, other plane took off' do
      plane_one = Plane.new
      plane_two = Plane.new
      subject.land(plane_one)
      subject.land(plane_two)
      subject.take_off(plane_two)
      expect(subject.hangar?(plane_one)).to be true
    end

    it 'both planes landed in airport, this plane took off' do
      plane_one = Plane.new
      plane_two = Plane.new
      subject.land(plane_one)
      subject.land(plane_two)
      subject.take_off(plane_two)
      expect(subject.hangar?(plane_two)).to be false
    end
  end
end
