require 'airport'

describe Airport do
  let(:plane) { spy :plane_double }
  let(:second_plane) { spy :second_plane_double }
  let(:weather_station) { spy :weather_station_double, report: 'stormy' }
  subject { described_class.new(weather_station: weather_station) }

  describe '#planes method' do

    it 'should respond to #planes method' do
      expect(subject).to respond_to(:planes)
    end

    it 'should return an array' do
      expect(subject.planes).to be_an_instance_of(Array)
    end
  end

  describe '#capacity method' do

    it 'should respond to #capacity' do
      expect(subject).to respond_to(:capacity)
    end

    it 'should have a default value for capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should allow the system designer to set capacity' do
      expect(described_class.new(capacity: 20).capacity).to eq 20
    end
  end

  describe '#order_landing method' do

    before(:each) do
      allow(weather_station).to receive(:report).and_return('sunny')
      subject.order_landing(plane)
    end

    it 'should order the plane to land and supply its id' do
      expect(plane).to have_received(:land).with(subject.__id__)
    end

    it 'should record that the plane is parked' do
      expect(subject.planes).not_to be_empty
    end

    it 'should raise error for landing when airport is full' do
      expect { subject.order_landing(second_plane) }.to raise_error "Cannot land, airport full"
      expect(second_plane).not_to have_received(:land)
    end

  end

  describe '#order_takeoff method' do

    before(:each) do
      allow(weather_station).to receive(:report).and_return('sunny')
      subject.order_landing(plane)
      subject.order_takeoff(plane)
    end

    it 'should order the plane to takeoff and supply its id' do
      expect(plane).to have_received(:takeoff).with(subject.__id__)
    end

    it 'should record that the planet has left the airport' do
      expect(subject.planes).to be_empty
    end

  end

  describe '#check_weather method' do

    it 'should ask for a weather report from the weather station' do
      subject.check_weather
      expect(weather_station).to have_received(:report)
    end

    it 'should store a weather report from the weather station' do
      subject.check_weather
      expect(subject.weather).to eq weather_station.report
    end

  end

  context '#order_takeoff and #order_landing in bad weather' do

    it 'should check weather before ordering to land' do
      allow(weather_station).to receive(:report).and_return('sunny')
      subject.order_landing(plane)
      expect(weather_station).to have_received(:report)
    end

    it 'should check weather before ordering to takeoff' do
      allow(weather_station).to receive(:report).and_return('sunny')
      subject.order_takeoff(plane)
      expect(weather_station).to have_received(:report)
    end

    it 'should raise error for landing when weather is stormy' do
      expect { subject.order_landing(plane) }.to raise_error "Landing prevented, stormy weather"
      expect(plane).not_to have_received(:land)
    end

    it 'should raise error for takeoff when weather is stormy' do
      expect { subject.order_takeoff(plane) }.to raise_error "Takeoff prevented, stormy weather"
      expect(plane).not_to have_received(:land)
    end

  end

end
