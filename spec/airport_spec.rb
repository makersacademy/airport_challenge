require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new } 
  let(:weather) { airport.weather }

  describe '#dock' do
    it 'is able to dock a plane' do
      allow(subject).to receive(:weather_is_stormy?) { false }
      subject.dock(plane)
      expect(subject.docking_bay).to include(plane)
    end

    it 'will not dock the same plane twice' do
      allow(subject).to receive(:weather_is_stormy?) { false }
      subject.dock(plane)
      expect { raise subject.dock(plane) }.to raise_error(RuntimeError)
    end

    it 'will not dock if the weather is stormy' do
      allow(subject).to receive(:weather_is_stormy?) { true }
      expect { raise subject.dock(plane) }.to raise_error(RuntimeError)
    end

    it 'will not dock if the docking bay is full' do
      allow(subject).to receive(:weather_is_stormy?) { false }
      subject.dock(Plane.new)
      expect { raise subject.dock(plane) }.to raise_error(RuntimeError)
    end

    it 'will not land planes if the custom capacity is full' do
      big_airport = Airport.new(10)
      allow(big_airport).to receive(:weather_is_stormy?) { false }
      10.times { Plane.new.land(big_airport) }
      expect { raise Plane.new.land(big_airport) }.to raise_error(RuntimeError)
    end
  end

  describe '#initialize' do
    it 'is created with a default capacity of 1' do
      expect(subject.capacity).to eq(1)
    end

    it 'can be created with a custom capacity' do
      big_airport = Airport.new(5)
      expect(big_airport.capacity).to eq(5)
    end
  end

  describe '#weather_is_stormy?' do
    it 'will return false if the weather is not stormy' do
      allow(airport).to receive(:weather_is_stormy?) { false }
      expect(airport.weather_is_stormy?).to eq(false)
    end

    it 'will return true if the weather is stormy' do
      allow(airport).to receive(:weather_is_stormy?) { true }
      expect(airport.weather_is_stormy?).to eq(true)
    end
  end

  describe '#dock_is_full' do
    it 'will return false if the dock is not full' do
      expect(airport.dock_is_full?).to eq(false)
    end

    it 'will return true if the dock is full' do
      allow(airport).to receive(:weather_is_stormy?) { false }
      airport.dock(plane)
      expect(airport.dock_is_full?).to eq(true)
    end
  end
end
