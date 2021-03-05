require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new('Schiphol') }
  let(:capacity) { 13 }
  let(:weather) { Weather.new }
  it { is_expected.to respond_to :name }

  it { is_expected.to respond_to :arrive }
  describe 'arrive' do
    it 'should see arriving airplanes, and save them' do
      expect(airport.arrive(plane)).to eq [plane]
    end
    it 'should not let planes arrive when at max capacity' do
      airport.capacity.times { airport.arrive(plane) }
      expect { airport.arrive(plane) }.to raise_error 'Airport is at max capacity.'
    end
    it 'should not let planes arrive in a storm' do
      airport.weather.weather_forecast = 'Stormy'
      expect { airport.arrive(plane) }.to raise_error 'It is not safe to land here right now.'
    end
  end

  describe 'depart' do
    it { is_expected.to respond_to :depart }
    it 'should no longer see the plane in our array' do
      3.times { airport.arrive(plane) }
      airport.depart(plane)
      expect(airport.planes).to eq []
    end
    it 'should not be able to have departing planes when empty' do
      expect { airport.depart(plane) }.to raise_error 'There are no planes at your disposal.'
    end
    it 'should not allow planes to depart during stormy weather' do
      airport.weather.weather_forecast = 'Stormy'
      expect { airport.depart(plane) }.to raise_error 'It is not safe to depart right now.'
    end
  end

  describe 'full' do
    it { is_expected.to respond_to :full? }
    it 'knows that the airport is at max capasity' do
      Airport::DEFAULT_CAPACITY.times { airport.arrive(plane) }
      expect(airport.full?).to eq true
    end
  end

  describe 'empty' do
    it { is_expected.to respond_to :empty? }
    it 'should know when the airport is empty' do
      expect(airport.empty?).to eq true
    end
  end

  describe 'change_capacity' do
    it { is_expected.to respond_to :change_capacity }
    it 'should be able to change capacity' do
      expect(airport.change_capacity(capacity)).to eq capacity
    end
  end

  describe 'safe_weather?' do
    it { is_expected.to respond_to :safe_weather? }
    it 'should know it is not safe to fly in stormy weather' do
      airport.weather.weather_forecast = 'Stormy'
      expect(airport.safe_weather?).to eq false
    end
  end

end
