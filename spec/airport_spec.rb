require 'airport'

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { Airport.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:plane_take_off) }

  describe '#land(plane)' do
    it 'stores all landed planes in the airport, if weather > 4' do
      airport.instance_variable_set(:@weather_grade, 6)
      expect(airport.land(plane)).to eq plane
    end
    it 'raises an error if weather <= 4' do
      airport.instance_variable_set(:@weather_grade, 3)
      expect{ airport.land(plane) }.to raise_error 'Sorry, the storm is too great!'
    end
  end

  describe 'plane_take_off' do
    it 'removes one plane from the planes array' do
      airport.instance_variable_set(:@weather_grade, 6)
      2.times { airport.land(plane) }
      expect(airport.plane_take_off).to eq plane

      airport.plane_take_off
      expect(airport.plane_take_off).to eq nil
    end
  end
end
