require 'airport'

describe Airport do
  it 'has a default capacity of 10' do
    weather = double('weather', :now => 'sunny')
    airport = Airport.new(weather: weather)
    10.times { airport.land(double('plane', :landed? => false)) }
    expect(airport.land(double('plane'))).to eq(false)
  end

  it 'default capacity can be overridden' do
    weather = double('weather', :now => 'sunny')
    airport = Airport.new(weather: weather, capacity: 100)
    100.times { airport.land(double('plane', :landed? => false)) }
    expect(airport.land(double('plane'))).to eq(false)
  end

  describe '#land' do
    context 'when the weather is sunny and there is space at the airport' do
      it 'lands a plane (returns true)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => false)
        expect(airport.land(plane)).to eq(true)
      end
    end
    
    context 'when the weather is stormy and there is space at the aiport' do
      it 'does not land a plane (returns false)' do
        weather = double('weather', :now => 'stormy')
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => false)
        expect(airport.land(plane)).to eq(false)
      end
    end

    context 'when the weather is sunny and there is no space at the aiport' do
      it 'does not land a plane (returns false)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather, capacity: 0)
        plane = double('plane', :landed? => false)
        expect(airport.land(plane)).to eq(false)
      end
    end

    context 'when the weather is stormy and there is no space at the aiport' do
      it 'does not land a plane (returns false)' do
        weather = double('weather', :now => 'stormy')
        airport = Airport.new(weather: weather, capacity: 0)
        plane = double('plane', :landed? => false)
        expect(airport.land(plane)).to eq(false)
      end
    end

    context 'given a plane which is already at the airport' do
      it 'does not land a plane (returns false)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => false)
        airport.land(plane)
        expect(airport.land(plane)).to eq(false)
      end
    end

    context 'given a plane which is already at another airport' do
      it 'does not land a plane (returns false)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => true)
        expect(airport.land(plane)).to eq(false)
      end
    end
  end

  describe '#launch' do
    context 'when the weather is sunny' do
      it 'launches a plane (returns true)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => false)
        airport.land(plane)
        expect(airport.launch(plane)).to eq(true)
      end
    end

    context 'when the weather is stormy' do
      it 'does not launch a plane (returns false)' do
        weather = double('weather', :now => 'sunny') # weather starts sunny, so plane can land...
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => false)
        airport.land(plane)
        allow(weather).to receive(:now).and_return('stormy') # ...then becomes stormy, so plane can't launch
        expect(airport.launch(plane)).to eq(false)
      end
    end

    context 'given a plane that is not in the airport' do
      it 'does not launch a plane (returns false)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => false)
        expect(airport.launch(plane)).to eq(false)
      end
    end

    context 'given a plane which has already been launched' do
      it 'does not launch a plane (returns false)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => false)
        airport.land(plane)
        airport.launch(plane)
        expect(airport.launch(plane)).to eq(false)
      end
    end

    context 'give a plane which is at another airport' do
      it 'does not launch a plane (returns false)' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = double('plane', :landed? => true)
        expect(airport.launch(plane)).to eq(false)
      end
    end
  end
end
