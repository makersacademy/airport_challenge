require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:capacity) { 13 }
  let(:weather) { Weather.new(0, 2, 10) }
  let(:airport) { Airport.new('Schiphol', capacity, weather) }

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
    it 'should not allow planes to arrive when the weather is unsafe' do
      windy_weather = Weather.new(15)
      windy_airport = Airport.new('a', 10, windy_weather)
      expect { windy_airport.arrive(plane) }.to raise_error 'It is not safe to land here at the moment.'
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

  end

  describe 'full' do
    it { is_expected.to respond_to :full? }
    it 'knows that the airport is at max capasity' do
      capacity.times { airport.arrive(plane) }
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

  describe '#safety_breach' do
    it { is_expected.to respond_to :safety_breach }
    it 'should do a safety checkup on the airport' do
      message = 'No safety breach.'
      expect { subject.safety_breach }.to output(message).to_stdout
    end
  end

end
