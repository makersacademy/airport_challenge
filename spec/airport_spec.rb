require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  context 'plane will land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'will instruct a plane to land at an airport' do
      expect(airport.land(:plane)).to include(:plane)
    end
  end

  context 'plane will take off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'will confirm that the plane is no longer in the airport' do
      expect(airport.take_off(:plane)).to eq "#{:plane} has taken off"
    end

    it 'will remove plane from airport hangar' do
      airport.land(:plane)
      airport.take_off(:plane)
      expect(airport.hangar).not_to include(:plane)
    end
  end

  context 'is full' do
    it 'will prevent landing and will have a default airport capacity that can be overridden' do
      Airport::DEFAULT_CAPACITY.times { airport.land(:plane) }
      expect { airport.land(:plane) }.to raise_error "Airport is full"
    end
  end

  context 'is stormy' do
    it { is_expected.to respond_to :report_storm }

    it 'will report the weather as stormy' do
      expect(airport.report_storm).to eq true
    end

    context 'storm has been reported' do
      before do
        airport.report_storm
      end

      it 'will prevent takeoff when weather is stormy' do
        expect { airport.take_off(:plane) }.to raise_error "Plane cannot take off due to storm"
      end

      it 'will prevent landing when weather is stormy' do
        expect { airport.land(:plane) }.to raise_error "Plane cannot land due to storm"
      end
    end
  end
  # Tests that can no longer be used as methods are now private

  # it { is_expected.to respond_to :stormy? }

  # it 'will output the weather as stormy' do
  #   subject.report_storm
  #   expect(subject).to be_stormy
  # end
end
