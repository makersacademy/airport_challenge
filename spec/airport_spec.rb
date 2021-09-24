require 'airport'
require 'aeroplane'

describe Airport do
  let(:plane1) { double :plane1 }
  let(:plane2) { double :plane2 }
  let(:weather_service) { double :weather_service, weather_report: :clear }
  let(:subject) { described_class.new(weather_service, 10) }
  describe '#land_plane' do
    it 'instructs a plane to land' do
      expect(subject.land_plane(plane1)).to eq(:ok)
    end

    it 'stops a plane landing when airport is full' do
      airport = Airport.new(weather_service, 1)
      airport.land_plane(plane1)
      expect { airport.land_plane(plane2) }.to raise_error("Airport is full")
    end

    it 'stops a plane landing when there is a storm' do
      expect(weather_service).to receive(:weather_report).and_return(:storm)
      expect { subject.land_plane(plane1) }.to raise_error("Plane cannot land due to bad weather")
    end
  end

  describe 'take_off' do
    it 'instruct a plane to take off' do
      expect(subject.take_off(plane1)).to eq(:ok)
    end

    it 'stops a plane taking off when there is a storm' do
      expect(weather_service).to receive(:weather_report).and_return(:storm)
      expect { subject.take_off(plane1) }.to raise_error("Plane cannot take-off due to bad weather")
    end
  end

end
