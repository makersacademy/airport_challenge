require 'airport'
describe Airport do
  describe 'landing' do
    it 'plane can land at airport' do
      expect(subject).to respond_to :land
    end
  end
  describe 'take off' do
    it 'confirm plane has left the airport' do
      allow(subject).to receive(:stormy?) { false }
      allow(subject.take_off).to receive(:stormy?) { false }
      expect { subject.take_off }.to output('The plane has left the airport').to_stdout
    end

    it 'plane can take_off' do
      expect(subject).to respond_to :take_off
    end
  end

  describe 'capacity tests' do
    before(:each) do
      @plane = Plane.new
      @airport = Airport.new(5)
      allow(@airport).to receive(:stormy?) { false }
    end
    describe 'capacity tests' do
      it 'can change default capacity' do
        expect(@airport.capacity).to eq 5
      end

      it 'can respond to capacity change and not land if full' do
        expect { 10.times { @airport.land(@plane) } }.to raise_error('Airport is currently full')
      end

      it 'can land if under capacity' do
        allow(@airport).to receive(:stormy?) { false }
        expect { 3.times { @airport.land(@plane) } }.not_to raise_error
      end
    end
  end

  context 'weather tests' do
    it 'cannot land in stormy weather' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error('Cannot land due to stormy weather')
    end

    it 'cannot take off in stormy weather' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { true }
      expect { airport.take_off }.to raise_error('Cannot take off due to stormy weather')
    end
  end
end
