require 'airport'

describe Airport do
  let(:plane) {double(:plane)}
  subject(:airport) { described_class.new }

  describe 'Normal airport functions' do

    it 'lands plane' do
      expect(airport).to receive(:stormy?) {false}
      airport.land(plane)
    end

    it 'confirm plane has landed' do
      allow(airport).to receive(:stormy?) {false}
      airport.land(plane)
      expect(airport.landed?(plane)).to be true
    end

    it 'instructs plane to take off' do
      allow(airport.planes).to receive(:landed?) {true}
      airport.planes << plane
      expect(airport).to receive(:stormy?) {false}
      airport.take_off(plane)
    end

    it 'checks if plane has departed' do
      expect(airport.departed?(plane)).to be true
    end
  end

  describe 'stormy weather' do

    it 'does not allow planes to land if the weather is stormy' do
      allow(airport).to receive(:stormy?) {true}
      message = 'Cannot land because of bad weather'
      expect{airport.land(plane)}.to raise_error message
    end

    it 'does not allow planes to take off if the weather is stormy' do
      allow(airport.planes).to receive(:landed?) {true}
      allow(airport).to receive(:stormy?) {false}
      airport.land(plane)
      allow(airport).to receive(:stormy?) {true}
      message = 'Cannot take off because of the bad weather'
      expect{airport.take_off(plane)}.to raise_error message
    end
  end

  describe 'airport capacity' do

    it 'has a default capacity of 20 planes' do
    allow(airport).to receive(:stormy?) {false}
    allow(airport).to receive(:landed?) {false}
      Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error 'Airport at capacity'
    end

    it 'allows a specified capacity' do
        random_capacity = Random.rand(5000)
        subject = described_class.new random_capacity
        expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'edge cases' do
    it 'does not allow plane to take off, if plane is not in airport' do
      allow(airport.planes).to receive(:landed?) {false}
      expect{airport.take_off(plane)}. to raise_error 'Plane is not in airport'
    end

    it 'does not request plane to land if landed' do
      allow(airport).to receive(:stormy?) {false}
      airport.land(plane)
      expect{airport.land(plane)}.to raise_error 'Plane has already landed'
    end
  end
end