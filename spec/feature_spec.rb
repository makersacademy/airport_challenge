require_relative '../lib/airport'


describe 'Feature tests' do

easyjet = Plane.new
ryanair = Plane.new

heathrow = Airport.new
gatwick = Airport.new(1)

  context 'when conditions are not stormy' do
    before { allow(gatwick).to receive(:stormy?).and_return false }

    it 'mutiple planes taking off and landing' do
      allow(heathrow).to receive(:stormy?).and_return false
      heathrow.land(easyjet)
      heathrow.land(ryanair)
      heathrow.take_off(easyjet)
      heathrow.take_off(ryanair)
    end

      context 'User Story 1:' do
        it 'instructs a plane to land and confirms plane has landed' do
          gatwick.land(easyjet)
          expect(easyjet.landed).to eq true
        end
      end

      context 'User Story 2:' do
        it 'instructs a plane to take off and confirms plane is no longer in the airport' do
          gatwick.take_off(easyjet)
          expect(easyjet.landed_status).to eq false
        end
      end

      context 'User Story 5:' do
        it 'prevents landing when airport is full' do
          gatwick.land(easyjet)
          message = "Airport full"
          expect { gatwick.land(ryanair) } .to raise_error message
        end
      end

  end

  context 'when conditions are stormy' do

      context 'User Story 3:' do
        it 'prevents take off when weather is stormy' do
          allow(gatwick).to receive(:stormy?).and_return true
          message = "Too stormy to take off"
          expect { gatwick.take_off(easyjet) } .to raise_error message
        end
      end

      context 'User Story 4:' do
        it 'prevents landing when weather is stormy' do
          allow(heathrow).to receive(:stormy?).and_return true
          message = "Too stormy to land"
          expect { heathrow.land(ryanair) } .to raise_error message
        end
      end
  end

  context 'User Story 6:' do
    it 'airport has a default capacity' do
      expect(heathrow.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'default capacity can be overridden as appropriate' do
      capacity = 20
      pisa = Airport.new(capacity)
      expect(pisa.capacity).to eq capacity
    end
  end

end
