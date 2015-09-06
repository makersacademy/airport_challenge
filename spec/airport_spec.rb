require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  subject {Airport.new}
  let(:plane) {Plane.new}

  before do
    allow(subject).to receive(:stormy?) {false}
  end

  describe 'take off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}
  end

  describe 'landing' do
    it {is_expected.to respond_to(:land).with(1).argument}
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
