require 'airport'

describe Airport do
  airport = Airport.new
  let(:plane) { double :plane }

  describe '#land' do
    it 'tells plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end
    it 'prevents plane from landing if airport is full' do
      Airport::DEFAULT_CAPACITY.times do 
        airport.land(:plane)
      end
      expect { airport.land(:plane) }.to raise_error "Plane cannot land. Airport is full"
    end
  end

  describe '#take_off' do
    it 'tells plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end

end
