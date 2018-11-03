require 'airport'

describe Airport do

  it { is_expected.to respond_to :hangar }

  describe '#landing' do

    it { is_expected.to respond_to(:landing).with(1).argument }

    it 'returns the plane landed' do
      plane = Plane.new
      expect(subject.landing(plane)).to eq [plane]
    end

    it 'raises an error when full' do
      Airport::DEFAULT_CAPACITY.times { subject.landing Plane.new }
      plane1 = Plane.new
      expect { subject.landing plane1 }.to raise_error 'Hangar is full'
    end

  end

  describe '#taking_off' do
    it { is_expected.to respond_to(:taking_off).with(1).argument }

    it 'returns the plane took off' do
      plane = Plane.new
      subject.landing(plane)
      expect(subject.taking_off(plane)).to eq plane
    end

    it 'raises an error when empty' do
      plane = Plane.new
      expect { subject.taking_off(plane) }.to raise_error 'Hangar is empty'
    end

  end

end
