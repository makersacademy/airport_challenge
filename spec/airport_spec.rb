require './lib/airport'
require './lib/plane'

describe Airport do
  let(:weather_good) { double :weather, :forecast => :sunny }
  let(:weather_bad) { double :weather, :forecast => :stormy }
  let(:plane) { double :plane }

  it 'should initialize with planes array to hold multiple planes' do
    expect(subject.planes).to eq([])
  end

  context '#capacity' do
    it 'should instantiate with a default capacity of 20' do
      expect(subject.capacity).to eq(20)
    end

    it 'should set default capacity' do
      subject.capacity = 50
      expect(subject.capacity).to eq(50)
    end
  end

  context '#accept_plane' do

    it 'should receive one argument' do
      expect(subject).to respond_to(:accept_plane).with(1).argument
    end

    it 'allows a Plane to land' do
      allow(plane).to receive(:land)
      expect(subject.accept_plane(plane)).to eq [plane]
    end

    it 'should raise error if weather conditions close airport' do
      subject.analyze_forecast(weather_bad)
      expect { subject.accept_plane(plane) }.to raise_error('Due to weather conditions landing is not authorized')
    end
  end

  context '#release_plane' do

    it 'should receive one argument' do
      expect(subject).to respond_to(:release_plane).with(1).argument
    end

    it 'should release plane if airport open' do
      allow(plane).to receive(:take_off)
      subject.release_plane(plane)
      subject.analyze_forecast(weather_good)
      expect(subject.release_plane(plane)).to eq true
    end

    it 'should raise error if weather conditions close airport' do
      allow(plane).to receive(:land)
      subject.accept_plane(plane)
      subject.analyze_forecast(weather_bad)
      expect { subject.release_plane(plane) }.to raise_error('Due to weather conditions take off is not authorized')
    end
  end

end
