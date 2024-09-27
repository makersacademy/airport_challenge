require 'airport'
require 'weather'

describe Airport do

  let(:plane) { double :plane }

  describe "#land" do

    before { allow(subject).to receive(:weather) { 'sunny' } }

    it 'lands plane at airport' do
      expect(subject.land(plane)).to eq [plane]
    end
    it 'throws error if airport is at full default capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
    end

    it 'throws error if airport is full at set capacity' do
      airport = Airport.new(50)
      allow(airport).to receive(:weather) { 'sunny' }
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Airport is full'
    end

    it 'throws error if plane is already in the airport' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane is already in airport'

    end

    it 'prevents landing when stormy' do
      allow(subject).to receive(:weather) { 'stormy' } 
      expect { subject.land(plane) }.to raise_error 'Weather too bad'
    end

  end

  describe "#take_off" do
    
    before { allow(subject).to receive(:weather) { 'sunny' } }

    it 'expects plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq []
    end

    it 'raises an error if plane had already taken off' do
      expect { subject.take_off(plane) }.to raise_error('Plane has already taken off')
    end

    it 'confirms plane has left the airport' do
      subject.land(plane)
      expect(subject.take_off(plane)).not_to include [plane]
    end

    it 'raises error if weather is stormy' do
      subject.land(plane)
      allow(subject).to receive(:weather) { 'stormy' } 
      expect { subject.take_off(plane) }.to raise_error 'Weather too bad'
    end

  end

  describe "#initialize" do

    it 'sets a default capacity if none given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'default capacity can be overridden' do
      airport = Airport.new(40)
      expect(airport.capacity).to eq 40
    end
  end

  describe "#weather" do
    it 'returns weather conditions' do
      expect(Weather::FORECAST.map { |_, value| value }).to include(subject.weather)
    end
  end

  describe "#in_airport?" do
      
    it 'checks if a plane is already in the airport' do
      allow(subject).to receive(:weather) { 'sunny' } 
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end
  end

end
