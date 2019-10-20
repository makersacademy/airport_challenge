require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane1) { Plane.new }
  let(:today) { Weather }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'returns the planes that have landed' do
      allow_any_instance_of(today).to receive(:sunny).and_return true
      expect(subject.land(plane1)).to eq(plane1)
    end
    it 'raises an error when weather is stormy' do
      allow_any_instance_of(today).to receive(:sunny).and_return false
      expect { subject.land(plane1) }.to raise_error 'Weather is stormy'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'after take_off the plane is flying?' do
      allow_any_instance_of(today).to receive(:sunny).and_return true
      expect(subject.take_off(plane1)).to be true
    end
    it 'raises an error when weather is stormy' do
      allow_any_instance_of(today).to receive(:sunny).and_return false
      expect { subject.take_off(plane1) }.to raise_error 'Weather is stormy'
    end
  end
end
