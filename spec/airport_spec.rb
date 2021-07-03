require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  context 'When it is not stormy' do
    before(:each) do 
      allow(subject).to receive(:weather_forecast).and_return("Sunny")
    end 

    it 'Allows landing' do
      expect(subject).to respond_to(:land)
    end

    it 'Allows takeoff' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'Check that takeoff removes plane from airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq([])
    end

    it 'Does method to check if plane in airport?' do
      subject.land(plane)
      expect(plane.status).to eq('In airport')
      subject.take_off(plane)
      expect(plane.status).to eq('Not in airport')
    end

    it 'Does not let plane land if capacity reached' do
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to raise_error("Airport full.")
    end

    it 'Has a capacity argument that can be changed' do
      expect(subject).to respond_to(:take_off).with(1).argument
      a = Airport.new(4)
      expect(a.capacity).to eq(4)
    end

    it 'Only allows planes in airport to takeoff' do
      expect { subject.take_off(plane) }.to raise_exception("Plane not present")
    end

    it 'Working weather generator' do
      expect(subject.weather_forecast).to eq("Sunny")
    end
  end
  # Test weather without allow forcing result
  it 'Tests random weather' do
    expect(['Sunny', 'Overcast', 'Wet', 'Cloudy']).to include(subject.weather_forecast)
  end
end
