require 'airport'
# require 'weather'

describe Airport do

  describe 'weather condition' do
    it { is_expected.to respond_to :condition }
    it { is_expected.to respond_to(:safe?).with(1).argument }

    it 'is safe to fly or land' do
      expect(subject.safe?('yes')).to eq true
    end

    it 'is safe not to fly or land' do
      expect(subject.safe?('no')).to eq false
    end

    it 'is safe not to land' do
      allow(subject).to receive(:safe?).and_raise('It is not safe to land')
      # plane = Plane.new
      # subject.safe?('no')
      # expect { subject.landing(plane) }.to raise_error 'It is not safe to land'
    end

    it 'is safe not to fly' do
      plane = Plane.new
      subject.landing(plane)
      allow(subject).to receive(:safe?).and_raise('It is not safe to fly')
      # subject.safe?('no')
      # expect { subject.taking_off(plane) }.to raise_error 'It is not safe to fly'
    end
  end

  describe '#hangar' do
    it { is_expected.to respond_to :hangar }

    it 'returns an empty hangar' do
      expect(subject.hangar).to eq []
    end

    it 'returns the plane(s) in the hangar' do
      plane = Plane.new
      subject.landing(plane)
      expect(subject.hangar).to eq [plane]
    end
  end

  describe '#landing' do
    it { is_expected.to respond_to(:landing).with(1).argument }

    it 'returns the plane landed' do
      plane = Plane.new
      subject.safe?('yes')
      expect(plane.status).to eq('flying')
      expect(subject.landing(plane)).to eq [plane]
      expect(plane.landed).to eq 'landed'
      expect(plane.status).to eq 'landed'
    end

    it 'raises an error when full' do
      Airport::DEFAULT_CAPACITY.times { subject.landing Plane.new }
      plane = Plane.new
      expect { subject.landing(plane) }.to raise_error 'Hangar is full'
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

    it 'returns the plane(s) in the hangar' do
      b50 = Plane.new
      subject.landing(b50)
      b60 = Plane.new
      subject.landing(b60)
      subject.taking_off(b50)
      expect(subject.hangar).to eq [b60]
      expect(b60.status).to eq 'landed'
    end
  end
end
