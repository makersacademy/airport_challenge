require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new(weather_reporter, 20) }
  let(:plane) { double :plane }
  let(:weather_reporter) { double :weather_reporter }

  describe '#land' do
    context 'When not stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end

      it "Instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      it 'Returns a plane that took off' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      context 'When full' do
        it 'raises an error' do
          20.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
        end
      end
    end

    context 'When stormy' do
      it 'raises an error' do
        allow(weather_reporter).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Cannot land plane; Weather is stormy!'
      end
    end
  end

  describe '#take_off' do
    context 'When not stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end
      it 'Instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
      it 'raises an error if plane is not at this airport' do
        other_airport = described_class.new(weather_reporter, 20)
        other_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error "Plane can't take off; Not at airport."
      end
    end

    context 'When Stormy' do
      it 'raises an error' do
        allow(weather_reporter).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error 'Plane cannot take off; Weather is stormy!'
      end
    end
  end

  context 'defaults' do
    # subject(:defaults_airport) { described_class.new(weather_reporter) }

    it 'has a default capacity' do
      default_airport = described_class.new(weather_reporter)
      allow(weather_reporter).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
    end
  end
end
