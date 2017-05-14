require 'airport'

describe Airport do
  subject(:airport) {described_class.new(2) }
  let(:plane) { double :plane}

  describe '#land' do
    context "When not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "Instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'When full' do
        it "Raises an error" do
          2.times do
            airport.land(:plane)
          end
          expect {airport.land(:plane)}.to raise_error "Cannot land - Airport full!"
        end
      end
    end

    context "When stormy" do
      it "Raises an error" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land - Stormy"
      end
    end
  end

  describe '#takeoff' do
    it "Instructs a plane to takeoff" do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end
  end
end
