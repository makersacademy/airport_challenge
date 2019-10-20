# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

require 'airport'


describe Airport do

let(:airport) { Airport.new }
let (:plane) { Plane.new }

describe '#land(plane)' do

  it 'allows planes to land at airport' do
    allow(subject).to receive(:stormy?).and_return false
    allow(subject).to receive(:already_landed?).and_return false
    subject.land(plane)
    end


    it 'does not allow planes to land if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error "It is too stormy to land"
  end
  it 'does not allow planes to land if airport is full' do
    allow(subject).to receive(:stormy?). and_return false
    allow(subject).to receive(:has_landed?).and_return false
end

  describe '#take_off(plane)' do
    it 'allows planes to take off from airport' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:has_landed?).and_return false
      subject.take_off(plane)
      expect(plane).to eq(plane)
      end

      it 'does not allow planes to take off if weather is stormy' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off(plane) }.to raise_error "it is too stormy for take off"
      end
    end
  end
end
