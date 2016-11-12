require 'airport.rb'

describe Airport do

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:plane) }

  it 'returns planes which have landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  describe '#land' do

    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error if airport is full' do
      subject.land(Plane.new)
      expect {subject.land(Plane.new)}.to raise_error 'Airport is full'
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

  end

end
