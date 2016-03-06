require 'airport'
require 'support/weather_spec'

describe Airport do
  let(:plane1) { double(:Plane, take_off: nil, land: nil) }
  let(:plane2) { double(:Plane, take_off: nil, land: nil) }

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity)}

    it 'has a default capacity constant' do
      expect(Airport::DEFAULT_CAPACITY).to be_a Integer
    end

    it 'accepts a capacity on initialization' do
      expect(Airport.new(10).capacity).to eq 10
    end
  end

  describe '#change_capacity' do
    it 'can have the capacity changed' do
      subject.change_capacity(Integer)
      expect(subject.capacity).to eq Integer
    end
  end

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'lands a plane' do
      subject.land plane1
      expect(subject.planes).to eq [plane1]
    end

    it 'tells the plane to land' do
      expect(plane1).to receive(:land).with subject
      subject.land plane1
    end

    it 'doesn\'t allow the plane to land if full' do
      20.times {subject.land plane1}
      expect{subject.land plane1}.to raise_error 'Airport full - cant\'t land!'
    end
  end

  describe '#full?' do
    it 'reports false if not full' do
      expect(subject).not_to be_full
    end

    it 'reports if full' do
      Airport::DEFAULT_CAPACITY.times {subject.land plane1}
      expect(subject).to be_full
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'removes a plane from airport when it leaves' do
      subject.land plane1
      subject.land plane2
      subject.take_off plane1
      expect(subject.planes).to eq [plane2]
    end

    it 'tells a plane to take off' do
      expect(plane1).to receive(:take_off)
      subject.take_off plane1
    end
  end

  describe 'Weather Spec' do
    it_behaves_like Weather
  end
end
