require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land) }

  describe '#land' do

    it 'accepts 1 argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'accepts an instance of Plane as the argument' do
      plane = double(:plane)
      expect(subject.land(plane)).to eq plane
    end

  end

  it { is_expected.to respond_to(:take_off) }

  describe '#take_off' do

    it 'accepts 1 argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'accepts an instance of Plane as the argument' do
      plane = double(:plane)
      expect(subject.take_off(plane)).to eq plane
    end

  end

end
