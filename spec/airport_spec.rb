require 'airport'
require 'plane'

RSpec.describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#land' do
    context 'when conditions are clear' do
      before do
        allow_any_instance_of(weather).to receive(:stormy?) { false }
      end
    end

    it 'instructs a plane to land' do
      expect(plane).to receive(:landed)
      subject.land(plane)
    end
  end

  it 'confirms the plane is in the airport' do
    allow(plane).to receive(:landed)
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  context 'when weather is stormy' do
    it 'prevents landing' do
      allow(plane).to receive(:land)
      allow(weather).to receive(:stormy?) { true }
      error = 'Landing not permited due to poor weather conditions'
      expect { airport.land(plane) }.to raise_error error
    end
  end

  it 'prevents plane from landing if already in airport' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'This plane has already landed'
  end

    it 'prevents landing when airport is full' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect { airport.land(another_plane) }.to raise_error 'This airport can\'t receive more planes'
  end

  describe '#take_off' do
    context 'when conditions are clear' do
      before do
        allow_any_instance_of(weather).to receive(:stormy?) { false }
      end
    end

    it 'instructs a plane to take off' do
      allow(plane).to receive(:landed)
      expect(plane).to receive(:taken_off)
      airport.land(plane)
      airport.take_off(plane)
    end
  end

  it 'confirms the plane is not in the airport' do
    allow(plane).to receive(:landed)
    allow(plane).to receive(:taken_off)
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).not_to include plane
  end

  context 'when conditions are poor' do
    it 'prevents take off' do
      allow(plane).to receive(:landed)
      allow(plane).to receive(:taken_off)
      allow(weather).to receive(:stormy?) { false }
      subject.land(plane)
      allow_any_instance_of(weather).to receive(:stormy?) { true }
      error = 'Take off not permited due to poor weather conditions'
      expect { subject.take_off(plane) }.to raise_error error
    end
  end

end
