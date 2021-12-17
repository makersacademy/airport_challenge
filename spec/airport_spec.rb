require 'airport'

describe Airport do
  
  describe '#land' do
    it 'lets an air traffic controller instruct a plane to land at an aiport' do
      expect(subject).to respond_to(:land).with(2).arguments
    end
    it 'raises an error when a plane tries to land when the airport is full' do
      forecast = Weather.new
      allow(forecast).to receive(:stormy?) { false }
      Airport::CAPACITY.times { subject.land(Plane.new, forecast) }
      expect { subject.land(Plane.new, forecast) }.to raise_error "The plane cannot land as airport is at capacity"
    end
    it 'raises an error when a plane tries to land during stormy weather' do
      forecast = Weather.new
      allow(forecast).to receive(:stormy?) { true }
      expect { subject.land(Plane.new, forecast) }.to raise_error "The plane cannot land as it is too stormy"
    end
  end

  describe '#take_off' do
    it 'lets an air traffic controller instruct a plane to take off from an airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'raises an error when a plane tries to take off during stormy weather' do
      forecast = Weather.new
      allow(forecast).to receive(:stormy?) { true }
      expect { subject.take_off(forecast) }.to raise_error "It's too stormy for a plane to take off right now"
    end
  end

  it 'confirms that a plane which has just taken off is no longer at the airport' do
    forecast = Weather.new
    allow(forecast).to receive(:stormy?) { false }
    2.times { subject.land(Plane.new, forecast) }
    subject.take_off(forecast)
    expect(subject.gone?).to eq true
  end

  it 'lets the Default Capacity of an airport be overridden' do
    subject.override_capacity(10)
    expect(Airport::CAPACITY).to eq 10
  end

end
