require 'airport'

describe Airport do

  subject(:airport) { described_class.new(50, weather_report) }
  let(:plane) { double :plane }
  let(:weather_report) { double :weather_report }

  describe '#land' do
    context 'when weather sunny' do
      before do
        allow(weather_report).to receive(:stormy?).and_return false
      end

      it 'tells a plane to land at an airport' do
        expect(airport).to respond_to(:land_plane).with(1).argument
      end

      context 'when full' do
        it 'raises an error' do
          50.times do
            airport.land_plane(plane)
          end
          expect { airport.land_plane(plane) }.to raise_error "Airport is full"
        end
      end
    end

    context 'when weather is stormy' do
      it "raise an error if it tries to land" do
        allow(weather_report).to receive(:stormy?).and_return true
        expect { airport.land_plane(plane) }.to raise_error "Cannot land: weather is stormy"
      end
    end
  end

  describe '#take_off' do
    context "when weather sunny" do
      it 'tells a plane to take off from an airport' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end

    context "when weather is stormy" do
      before do
        allow(weather_report).to receive(:stormy?).and_return true
      end

      it "raises an error if it tries to take off" do
        expect { airport.take_off(plane) }.to raise_error "Cannot take off: weather is stormy"
      end

    end

  end

end
