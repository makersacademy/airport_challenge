require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  context 'good weather' do
    it 'confirms plane has landed' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect { subject.land(plane) }.to output("#{plane} has landed").to_stdout
    end

    it 'confirms plane is no longer in airport' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect { subject.take_off(plane) }.to output("#{plane} is no longer in airport").to_stdout
    end
  end

  context 'stormy weather' do
    it 'prevents take off' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{ subject.take_off(plane) }.to raise_error "Cannot take off due to stormy conditions!"
    end

    it 'prevents landing' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{ subject.land(plane) }.to raise_error "Cannot land due to stormy conditions!"
    end
  end

  context 'airport is full' do
    it 'prevents landing' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect { 21.times{ subject.land(plane) }}.to raise_error "Unable to land. Airport has reached its maximum capacity"
    end
  end

  describe 'as a system designer' do
    it 'set a new dafault capacity' do
      expect(subject.capacity).to eq 20
    end

    it 'add plane' do
      subject.add_plane
      expect(subject.planes_in_airport.size).to eq 1
    end
  end

end
