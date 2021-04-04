require 'airport'

describe Airport do
  describe '#capacity' do
    it { is_expected.to respond_to(:capacity) }

    it 'capacity automatically sets to DEFAULT_CAPACITY' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end

  describe '#change_capacity' do
    it { is_expected.to respond_to(:change_capacity).with(1).argument }
 
    it 'change_capacity changes capacity' do
      new_capacity = 100
      subject.change_capacity(new_capacity)
      expect(subject.capacity).to eq(new_capacity)
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  
    it 'plane cannot land if default capacity airport full' do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error('Airport full!')
    end

    it 'plane cannot land if airport full after capacity change' do
      plane = Plane.new
      new_capacity = 12
      subject.change_capacity(new_capacity)
      new_capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error('Airport full!')
    end

    it 'plane cannot land if airport full after numerous operations' do
      plane_one = Plane.new
      plane_two = Plane.new
      plane_three = Plane.new
      plane_four = Plane.new
      plane_five = Plane.new
      plane_six = Plane.new
      new_capacity = 4
      subject.change_capacity(new_capacity)
      subject.land(plane_one)
      subject.land(plane_two)
      subject.land(plane_three)
      subject.take_off(plane_two)
      subject.land(plane_four)
      subject.land(plane_five)
      subject.take_off(plane_one)
      subject.land(plane_one)
      subject.take_off(plane_five)
      subject.land(plane_six)
      expect { subject.land(plane_five) }.to raise_error('Airport full!')
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
  end

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
