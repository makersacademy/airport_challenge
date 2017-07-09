require 'airport'
require 'plane'

describe Airport do
  let(:fake_weather) do
    doubled = double(:weather)
    allow(doubled).to receive(:weather_report).and_return(:sunny)
    doubled
  end

  subject(:airport) { described_class.new(fake_weather) }
  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'starts with an empty airport' do
      expect(subject.planes).to eq []
    end

    it 'the capacity can vary appropriately' do
      expect(Airport.new(fake_weather, 30).capacity).to eq 30
    end
  end

  describe '#land_plane' do
    it { is_expected.to respond_to(:land_plane) }

    it 'prevents landing when the weather is stormy' do
      allow(fake_weather).to receive(:weather_report).and_return(:stormy)
      expect { airport.land_plane(plane) }.to raise_error 'Error plane cannot land in stormy weather'
    end

    it 'lands a plane' do
      subject.land_plane(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

    it 'raises an error if the airport is full' do
      subject.capacity.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error 'The airport is full!'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'takes off a plane' do
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.planes.include?(plane)).to eq false
    end
  end

  it 'prevents take off when the weather is stormy' do
    airport.land_plane(plane)
    allow(fake_weather).to receive(:weather_report).and_return(:stormy)
    expect { airport.take_off(plane) }.to raise_error 'Error plane cannot fly in stormy weather'
  end

  it 'raises an error if the airport is empty' do
    expect { subject.take_off(plane) }.to raise_error 'The airport is empty!'
  end
end
