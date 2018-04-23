require 'airport'
require 'weather'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(weather: SunnyWeather.new) }
  let(:plane) { Plane.new }

  class SunnyWeather
    def stormy?
      false
    end
  end

  it 'instructs the plane to land' do
    subject.land plane
  end
  it 'has the plane' do
    subject.land plane
    expect(subject.planes).to include plane
  end
  it 'instruct the plane to take off' do
    subject.land plane
    subject.take_off(plane)
  end
  it "doesn't have the plane" do
    subject.land plane
    subject.take_off(plane)
    expect(subject.planes).not_to include plane
  end

  describe '#take_off(plane)' do
    it 'raises error if plane is not in airport' do
      subject.land plane
      subject.take_off plane
      expect { subject.take_off(plane) }.to raise_error 'This plane is not in this airport'
    end
  end

  describe '#land(plane)' do
    it 'raises error if airport is full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'stormy weather' do
    subject(:airport) { described_class.new(weather: StormyWeather.new) }
    class StormyWeather
      def stormy?
        true
      end
    end
    it 'raises error the weather is stormy' do
      expect { subject.land(plane) }.to raise_error 'The weather is stormy'
    end
    it 'raises error if weather is stormy' do
      expect { subject.take_off(plane) }.to raise_error 'The weather is stormy'
    end
  end

end
