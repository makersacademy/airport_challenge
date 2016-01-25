require 'plane'

describe Plane do
  describe '#land' do
    it do
      is_expected.to respond_to(:land).with(1).argument
    end

    it 'fails if not passed an Airport object' do
      expect { subject.land(Plane.new) }.to raise_error 'Must land at a valid airport'
    end
  end

  describe '#take_off' do
    it do
      is_expected.to respond_to(:take_off).with(1).argument
    end
    it 'fails if not passed an Airport object' do
      expect { subject.take_off(Plane.new) }.to raise_error 'Must take off from a valid airport'
    end
  end
  
  it 'lands at an airport and confirms it has landed' do
    airport = Airport.new
    airport.weather = 'sunny'
    subject.land(airport)
    expect(subject).to be_landed
  end

  it 'takes off from an airport and confirms it is no longer landed' do
    airport = Airport.new
    airport.weather = 'sunny'
    subject.take_off(airport)
    expect(subject).not_to be_landed
  end

  it 'cannot land at an airport experiencing stormy weather' do
    airport = Airport.new
    airport.weather = 'stormy'
    expect { subject.land(airport) }.to raise_error 'Unable to land during stormy weather'
  end

  it 'cannot take off from an airport experiencing stormy weather' do
    airport = Airport.new
    airport.weather = 'stormy'
    expect { subject.take_off(airport) }.to raise_error 'Unable to take off during stormy weather'
  end

  it 'cannot land at an already full airport' do
    airport = Airport.new
    Airport::CAPACITY.times{Plane.new.land(airport)}
    expect { subject.land(airport) }.to raise_error 'Unable to land at full airport'
  end
end