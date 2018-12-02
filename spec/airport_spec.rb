require 'airport'

RSpec.describe Airport do
  before(:each) do
    @weather = Weather.new
    @airport = Airport.new(Airport::DEFAULT_CAPACITY, @weather)
    allow(@weather).to receive(:stormy?) { false }
  end

  it 'ignores the default capacity if a new one is given' do
    @airport = Airport.new(2, @weather)
    2.times { @airport.land(Airplane.new) }
    expect { @airport.land(Airplane.new) }.to raise_error 'Airport full'
  end

  describe '#land' do

    it 'raises an error if the plane tries to land two times' do
      airplane = Airplane.new
      @airport.land(airplane)
      expect { @airport.land(airplane) }.to raise_error 'The plane has already landed'
    end

    it 'raises an error if the plane tries to land and the airport is full' do
      Airport::DEFAULT_CAPACITY.times { @airport.land(Airplane.new) }
      expect { @airport.land(Airplane.new) }.to raise_error 'Airport full'
    end

    it 'lets the plane land if the weather is good' do
      airplane = Airplane.new
      expect(@airport.land(airplane)).to include(airplane)
    end

    it 'raises an error if the weather is stormy and the plane tries to land' do
      allow(@weather).to receive(:stormy?) { true }
      expect { @airport.land(Airplane.new) }.to raise_error 'The weather is stormy'
    end

  end

  describe '#take_off' do

    it 'raises an error if the plane tries to take off but it hasnt landed yet' do
      airplane1 = Airplane.new
      airplane2 = Airplane.new
      @airport.land(airplane1)
      expect { @airport.take_off(airplane2) }.to raise_error 'The plane hasnt landed yet'
    end

    it 'raises an error if the plane tries to take off but there are no planes in the airport' do
      expect { @airport.take_off(Airplane.new) }.to raise_error 'The plane hasnt landed yet'
    end

    it 'raises an error if the weather is stormy and the plane tries to take_off' do
      airplane = Airplane.new
      @airport.land(airplane)
      allow(@weather).to receive(:stormy?) { true }
      expect { @airport.take_off(airplane) }.to raise_error 'The weather is stormy'
    end

    it 'lets the plane take off if the weather is good' do
      airplane = Airplane.new
      @airport.land(airplane)
      expect(@airport.take_off(airplane)).to eq airplane
    end

  end

  it 'checks if the airplane is in the airport' do
    airplane = Airplane.new
    expect(@airport.in_the_airport?(airplane)).to eq FALSE
  end

end
