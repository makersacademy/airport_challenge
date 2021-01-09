require 'airport'

describe Airport do

  subject(:airport) { Airport.new(20) }
  let(:plane) { double :plane }

  context 'when a plane is landing' do

    it 'instruct the plane' do
      expect(airport).to respond_to(:land).with(1).argument
    end
  
    context 'when airport is full' do

      it 'raises error' do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Cannot land plane - airport full"
      end
      
    end

  end

  context 'when a plane is taking off' do

    it 'instruct the plane' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

  end

end