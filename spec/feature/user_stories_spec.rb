describe 'User Stories' do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }
  context 'when not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
    
    it 'so planes land at airports, instructing plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end
    
    it 'so planes take off from airports, instructing plane to take off' do
      expect { airport.take_off(plane) }.not_to raise_error
    end
    
    context 'when airport is full' do
      it 'does not allow planes to land' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane airport full'
      end
    end
  end
  
  context 'when weather is stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end
    it 'does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane weather is stormy'
    end

    it 'does not allow planes to take off' do
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane weather is stormy'
    end
  end
end 