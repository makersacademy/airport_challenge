require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane1) { Plane.new }
  let(:weather) { double }
  subject(:airport) { Airport.new(10, weather) }

  context "when sunny" do
    before do
    allow(weather).to receive(:sunny).and_return true
    end

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'airport has a default capacity' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land(plane1)
      end
      expect { subject.land(plane1) }.to raise_error 'Airport is full'
    end

    it 'returns the plane that has landed' do
      expect(subject.land(plane1)).to eq(plane1)
    end

    it 'after take_off the plane is flying?' do
      expect(subject.take_off(plane1)).to be true
    end

    it 'raises an error when airport is full' do
      10.times do
        airport.land(plane1)
      end
      expect { subject.land(plane1) }.to raise_error 'Airport is full'
    end

  end

  context "when stormy" do
    before do
    allow(weather).to receive(:sunny).and_return false
    end

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'raises an error when weather is stormy' do
      expect { subject.land(plane1) }.to raise_error 'Weather is stormy'
    end

    it 'raises an error when weather is stormy' do
      expect { subject.take_off(plane1) }.to raise_error 'Weather is stormy'
    end
  end
end
