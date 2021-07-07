require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    it "instructs a plane to land" do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument
    end

    context 'when full' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return false
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
      end
    end

    it 'raises an error when asked to land a plane when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
    end
  end

  describe '#take_off' do
    it "allows a plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end

end

#  As an air traffic controller, to ensure safety
#  I want to prevent take_off when weather is stormy

# context "preventing take-off in stormy weather" do
#    it "states the plane can't leave due to storms" do
#      expect(subject.take_off).to eq "Can't take off during storms."
#    end
#  end
