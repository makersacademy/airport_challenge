require 'airport'

describe Airport do
  let(:airport) { described_class.new("London Heathrow") }
  let(:weather) { double(:weather, :stormy? => false) }

  describe '#new' do

    it 'must have a name' do
      expect { Airport.new }.to raise_error ArgumentError
    end

    it 'can be named when created' do
      airport = Airport.new("London Gatwick")
      expect(airport.name).to eq "London Gatwick"
    end

    it 'has a weather' do
      airport = Airport.new("London Heathrow", weather)
      expect(airport.weather.stormy?).to eq false
    end
  end

end
