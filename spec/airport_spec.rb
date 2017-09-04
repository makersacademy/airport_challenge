# spec/airport_spec.rb

require 'airport'

RSpec.describe Airport do
  subject(:airport) { described_class.new }
  let(:airplane) { double :airplane }
  let(:weather) { double :weather }

  describe '#land' do
    before do
      allow(airplane).to receive(:land)
    end

    it 'lands a plane in the airport' do
      allow(weather).to receive(:stormy?).and_return false
      subject.land(airplane, weather)
    end

    it 'has the plane after it has landed' do
      allow(weather).to receive(:stormy?).and_return false
      subject.land(airplane, weather)
      expect(subject.airplanes).to include airplane
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'raise an error when the airport is full' do
      allow(weather).to receive(:stormy?).and_return false
      subject.capacity=(1)
      subject.land(airplane, weather)
      error = 'Cannot land since airport is full'
      expect { subject.land(airplane, weather) }.to raise_error error
    end

    it 'storm blocks landing' do
      allow(weather).to receive(:stormy?).and_return true
      message = 'Unable to land due to stormy weather'
      expect { subject.land(airplane, weather) }.to raise_error message
    end

    it 'a airplane can land after storm has cleared' do
      allow(weather).to receive(:stormy?).and_return false
      expect { subject.land(airplane, weather) }.not_to raise_error
    end
  end

  describe '#takeoff' do
    before do
      allow(airplane).to receive(:land)
      allow(airplane).to receive(:takeoff)
    end

    it 'instruct a plane to take off' do
      allow(weather).to receive(:stormy?).and_return false
      subject.land(airplane, weather)
      subject.takeoff(airplane, weather)
    end

    it 'comfirm the plane is no longer in the airport' do
      allow(weather).to receive(:stormy?).and_return false
      subject.land(airplane, weather)
      subject.takeoff(airplane, weather)
      expect(subject.airplanes).not_to include airplane
    end

    it 'raise an error when there are no planes in the airport' do
      allow(weather).to receive(:stormy?).and_return false
      message = 'No airplanes in the airport'
      expect { subject.takeoff(airplane, weather) }.to raise_error message
    end

    it 'storm blocks takeoff' do
      allow(airplane).to receive(:land)
      subject.airplanes=([airplane])
      allow(weather).to receive(:stormy?).and_return true
      message = 'Cannot take off due to stormy weather'
      expect { subject.takeoff(airplane, weather) }.to raise_error message
    end

    it 'a plane can takeoff after storm has cleared' do
      allow(airplane).to receive(:land)
      allow(weather).to receive(:stormy?).and_return false
      subject.land(airplane, weather)
      expect { airport.land(airplane, weather) }.not_to raise_error
    end
  end

  describe '#initialization' do
    before do
      allow(airplane).to receive(:land)
    end

    it 'defaults capacity' do
      allow(weather).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { subject.land(airplane, weather) }
      message = 'Cannot land since airport is full'
      expect { subject.land(airplane, weather) }.to raise_error message
    end
  end
end
