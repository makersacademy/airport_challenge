require 'airport'

describe Airport do
  it 'has a default capacity of 10' do
    weather = double('weather', :now => 'sunny')
    airport = Airport.new(weather: weather)
    10.times { airport.land(double('plane')) }
    expect(airport.land(double('plane'))).to eq(false)
  end
  it 'default capacity can be overridden' do
    weather = double('weather', :now => 'sunny')
    airport = Airport.new(weather: weather, capacity: 100)
    100.times { airport.land(double('plane')) }
    expect(airport.land(double('plane'))).to eq(false)
  end
  describe '#land' do
    context 'when the weather is sunny and there is space at the airport' do
      it 'lands a plane (returns true)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather, capacity: 10)
        plane = double('plane')
        expect(airport.land(plane)).to eq(true)
      end
    end
    
    context 'when the weather is stormy and there is space at the aiport' do
      it 'does not land a plane (returns false)' do
        weather = double('weather', :now => 'stormy')
        airport = Airport.new(weather: weather, capacity: 10)
        plane = double('plane')
        expect(airport.land(plane)).to eq(false)
      end
    end

    context 'when the weather is sunny and there is no space at the aiport' do
      it 'does not land a plane (returns false)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather, capacity: 0)
        plane = double('plane')
        expect(airport.land(plane)).to eq(false)
      end
    end

    context 'when the weather is stormy and there is no space at the aiport' do
      it 'does not land a plane (returns false)' do
        weather = double('weather', :now => 'stormy')
        airport = Airport.new(weather: weather, capacity: 0)
        plane = double('plane')
        expect(airport.land(plane)).to eq(false)
      end
    end
  end
end
