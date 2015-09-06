require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  subject {Airport.new}
  let(:plane) {Plane.new}

  before do
    allow(subject).to receive(:weather_cond) {"sunny"}
  end

  describe 'take off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'releases a plane' do
      subject.land(plane)
      expect {subject.take_off(plane)}.to change {subject.plane_total}.by (-1)
    end
  end

  describe 'landing' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'receives a plane' do
      expect {subject.land(plane)}.to change {subject.plane_total}.by (1)
    end
  end

  describe 'traffic control' do
    it 'does not allow a plane to land when airport at capacity' do
      5.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error 'Airport at capacity'
    end

    it 'does not allow a plane to take off if airport is empty' do
      subject.empty?
      expect {subject.take_off(plane)}.to raise_error 'Airport is empty'
    end
  end
end
