# spec/airport_spec.rb

require 'airport'

RSpec.describe Airport do
  subject(:airport) { described_class.new }
  let(:airplane) { double :airplane }

  describe '#land' do
    before do
      allow(airplane).to receive(:landed=)
    end

    it 'lands a plane in the airport' do
      subject.land(airplane)
    end

    it 'has the plane after it has landed' do
      subject.land(airplane)
      expect(airport.airplanes).to include airplane
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'raise an error when the airport is full' do
      subject.capacity=(1)
      subject.land(airplane)
      expect { subject.land(airplane) }.to raise_error 'Airport is full'
    end
  end

  describe '#takeoff' do
    before do
      allow(airplane).to receive(:landed=)
    end

    it 'instruct a plane to take off' do
      subject.land(airplane)
      subject.takeoff(airplane)
    end

    it 'comfirm the plane is no longer in the airport' do
      subject.land(airplane)
      subject.takeoff(airplane)
      expect(airport.airplanes).not_to include airplane
    end

    it 'raise an error when there are no planes in the airport' do
      expect { subject.takeoff(airplane) }.to raise_error 'No airplanes in the airport'
    end
  end

  describe '#initialization' do
    before do
      allow(airplane).to receive(:landed=)
    end

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.land(airplane) }
      expect { subject.land(airplane) }.to raise_error 'Airport is full'
    end
  end
end
