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

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:take_off) }

  describe '#initialize' do
    it 'starts with an empty airport' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land_plane' do
    it 'raises an error, if plane has already landed' do
      plane.landed
      expect { subject.land_plane(plane) }.to raise_error 'This plane has already landed'
    end

    it 'lands a plane' do
      subject.land_plane(plane)
      expect(subject.planes.include?(plane)).to eq true
    end
  end

  describe '#take_off' do
    it 'raises an error, if plane is already flying' do
      plane.flying
      expect { subject.take_off(plane) }.to raise_error 'This plane is already flying'
    end

    it 'takes off a plane' do
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.planes.include?(plane)).to eq false
    end
  end

  it 'prevents take off when the weather is stormy' do
    airport.land_plane(plane)
    allow(fake_weather).to receive(:weather_report).and_return(:stormy)
    expect { airport.take_off(plane) }.to raise_error 'Error cannot fly in stormy weather'
  end

end
