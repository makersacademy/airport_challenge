# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

require 'airport'


describe Airport do

let(:airport) { Airport.new }
let (:plane) { Plane.new }

describe '#land(plane)' do
  it 'allows planes to land at airport' do
    subject.land(plane)
    end
  end
  describe '#take_off(plane)' do
    it 'allows planes to take off from airport' do
      subject.take_off(plane)
      expect(plane).to eq(plane)
      end
      it 'does not allow planes to take off if weather is stormy' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off(plane) }.to raise_error "it is too stormy for take off"
      end
    end
end
