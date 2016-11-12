require 'airport.rb'

describe Airport do

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:planes) }

  it 'returns planes which have landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  describe '#land' do

    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error if airport is full' do
      50.times { subject.land(Plane.new) }
      expect {subject.land(Plane.new)}.to raise_error 'Airport is full'
    end

    it 'changes the landed status of the plane' do
      plane = Plane.new
      plane.take_off
      subject.land(plane)
      expect(plane.landed?).to eq true
    end

  end

  describe '#take_off' do

    it 'lets a plane take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'raises an error if plane is not in airport' do
      plane = Plane.new
      expect {subject.take_off(plane)}.to raise_error 'Plane is not in airport'
    end

    it 'changes the landed status of a the plane' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(plane.landed?).to eq false
    end

    it 'gets rid of the plane from the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

  end

end
