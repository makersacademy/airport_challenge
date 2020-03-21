require 'plane'

describe Plane do
  let(:full_airport) do 
    airport = Airport.new 

    10.times do
      plane = Plane.new
      plane.land(airport)
    end
    
    airport
  end

  context 'landing' do
    it 'can be instructed to land at an airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'will not land if the airport is full' do
      expect { subject.land(full_airport) }.to raise_error 'Unable to land, airport is full'
    end
  end

  context 'taking off' do
    it 'can be instructed to take off from an airport' do
      expect(subject).to respond_to(:take_off)
    end

    it 'confirms it is no longer in the airport after it has taken off' do
      expect(subject.take_off).to eq "No longer in the airport"
    end
  end
end
