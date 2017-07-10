require 'airport'
require 'plane'

describe Airport do
  let(:fake_weather) do
    doubled = double(:weather)
    allow(doubled).to receive(:weather_report).and_return(:sunny)
    doubled
  end

  subject(:airport) { described_class.new(fake_weather) }
  let(:plane) { double :plane }
  let(:new_capacity) { 30 }

  describe '#initialize' do
    it 'starts with an empty airport' do
      expect(subject.planes).to be_empty
    end

    it 'can be set with a different capacity' do
      expect(Airport.new(fake_weather, new_capacity).capacity).to eq new_capacity
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#land_plane' do
    it 'prevents landing when the weather is stormy' do
      allow(fake_weather).to receive(:weather_report).and_return(:stormy)
      expect { airport.land_plane(plane) }.to raise_error 'Error plane cannot land in stormy weather'
    end

    it 'instructs the plane to land' do
      expect(airport).to receive(:land_plane)
      airport.land_plane(plane)
    end

    it 'lands a plane' do
      airport.land_plane(plane)
      expect(airport.planes).to include plane
    end

    it 'raises an error if the airport is full' do
      subject.capacity.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error 'The airport is full!'
    end
  end

  describe '#take_off' do

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
    allow(airport).to receive(:planes) { [] }
    expect { subject.take_off(plane) }.to raise_error 'The airport is empty!'
  end
end
