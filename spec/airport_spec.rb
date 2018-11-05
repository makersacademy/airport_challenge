require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
  context 'no storm' do
    it "should respond to '#land(plane)" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'allows planes to land' do
      allow(airport).to receive(:current_weather).and_return('Sunny')
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'raises an error when attempting to land at full airport' do
      allow(airport).to receive(:current_weather).and_return('Sunny')
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Too busy to land!'
    end
  end

  context 'during a storm' do
    it 'raises an error if plane attempts landing' do
      allow(airport).to receive(:current_weather).and_return('Stormy')
      expect { airport.land(plane) }.to raise_error 'Too stormy to land!'
    end
  end
  end

  describe '#takeoff' do
  context 'no storm' do
    it 'allows planes to take-off' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end
  end

  context 'during a storm' do
    it 'raises an error if plane attempts to take-off' do
      allow(airport).to receive(:current_weather).and_return('Stormy')
      expect { airport.takeoff(plane) }.to raise_error 'Too stormy to take-off!'
    end
  end
  end
end
