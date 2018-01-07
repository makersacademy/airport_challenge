require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'airport has plane after landing' do
      airport.land(plane)
      expect(airport.hangar).to include plane
    end
  end

  describe '#takeoff' do
    it 'plane is gone after takeoff' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.hangar).not_to include plane
    end

    it 'prevents takeoff when weather is stormy' do
      airport.land(plane)
      airport.instance_variable_set(:@weather_condition, :stormy)
      message = 'Due to current weather conditions all planes are grounded'
      expect{ airport.takeoff(plane) }.to raise_error message
    end

  end

end
