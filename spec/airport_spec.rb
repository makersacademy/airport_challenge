require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  before do
    allow(airport).to receive(:stormy?).and_return false
  end

  describe 'take off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'releases a plane' do
      airport.land(plane)
      expect {airport.take_off(plane)}.to change {airport.plane_total}.by -1
    end
  end

  describe 'landing' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'receives a plane' do
      expect {airport.land(plane)}.to change {airport.plane_total}.by 1
    end
  end

  describe 'traffic control' do
    it 'does not allow a plane to land when airport at capacity' do
      5.times {airport.land(plane)}
      expect {airport.land(plane)}.to raise_error 'Airport at capacity'
    end

    it 'does not allow a plane to take off if airport is empty' do
      airport.empty?
      expect {airport.take_off(plane)}.to raise_error 'Airport is empty'
    end

    it 'will not let a plane land if stormy' do
      allow(airport).to receive(:stormy?).and_return true
      plane.land
      expect {airport.land(plane)}.to raise_error 'Weather is stormy'
    end

    it 'will not let a plane take off if stormy' do
      plane.land
      allow(airport).to receive(:stormy?).and_return true
      expect {airport.take_off(plane)}.to raise_error 'Weather is stormy'
    end
  end
end
