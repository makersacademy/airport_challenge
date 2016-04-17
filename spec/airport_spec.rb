require 'airport'
require 'weather'
describe Airport do

  describe 'initialization' do
    subject = Airport.new
    let(:plane) { Plane.new }
    it 'defaults capacity' do
      Airport::DEFAULT_CAPACITY.times do
      subject.land(plane)
      end
    expect{ subject.land(plane) }.to raise_error 'The airport is full'
    end
  end

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'allows planes to land' do
      plane = double(:plane)
      expect {subject.land(plane).to eq plane}
    end
    it 'raises an error when trying to land in a full airport' do
      plane = double(:plane)
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "The airport is full"
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'allows planes to take off' do
      plane = double(:plane)
      expect {subject.take_off(plane).to eq plane}
    end

    it 'raises an error when trying to take off when bad weather' do
      airport = Airport.new
      stormy_weather = Weather.new
      allow(stormy_weather).to receive(:stormy).and_return true
      allow(airport).to receive(:weather).and_return(stormy_weather)
      message =
      expect {airport.take_off(double (:plane))}.to raise_error "Flight cancelled due to bad weather"
    end
  end
end
