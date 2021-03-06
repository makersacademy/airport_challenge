require 'airport'
require 'plane'
require 'weather'
require 'safety_breach'

describe Airport do
  let(:plane) { Plane.new }
  let(:capacity) { 13 }
  let(:weather) { Weather.new(0, 2, 10) }
  let(:safe_situation) { SafetyBreach.new([1]) }
  let(:airport) { Airport.new('Schiphol', capacity, weather, safe_situation) }

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
      windy_airport = Airport.new('a', 10, windy_weather, safe_situation)
      expect { windy_airport.arrive(plane) }.to raise_error 'It is not safe to land here at the moment.'
    end
    it 'should not allow planes to arrive when under terrorist attack.' do
      airport_under_attack = Airport.new('Heathrow', capacity, weather, SafetyBreach.new([8]))
      expect { airport_under_attack.arrive(plane) }.to raise_error 'This airport is in a quarantaine situation, no access.'
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
    it 'should not allow planes to leave whilst under terrorist attack' do
      airport.arrive(plane)
      airport_under_attack = Airport.new('Heathrow', capacity, weather, SafetyBreach.new([8]))
      expect { airport_under_attack.depart(plane) }.to raise_error 'This airport is in a quirantaine situation, no planes can leave.'
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
  end

  describe '#terrorist_protocol' do
    it { is_expected.to respond_to :terrorist_protocol }
    it 'should know if the airport is under a terrorist threat' do
      airport_under_attack = Airport.new('Heathrow', capacity, weather, SafetyBreach.new([8]))
      expect(airport_under_attack.safety_breach).to eq true
    end
  end

end
