require 'airport'
require 'plane'

RSpec.describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:next_plane) { double :next_plane }
  let(:weather) { double :weather }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#land' do
    context 'when conditions are clear' do
      before do
        allow(weather).to receive(:stormy?) { false }
      end
    end

    it 'instructs a plane to land' do
      expect(plane).to receive(:land)
      subject.land(plane)
    end
  end

  it 'confirms the plane is in the airport' do
    allow(plane).to receive(:land)
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
    expect { airport.land(next_plane) }.to raise_error 'This airport is full'
  end

  describe '#take_off' do
    context 'when conditions are clear' do
      before do
        allow(weather).to receive(:stormy?) { false }
      end
    end

    it 'instructs a plane to take off' do
      allow(plane).to receive(:land)
      expect(plane).to receive(:take_off)
      airport.land(plane)
      airport.take_off(plane)
    end

    it 'confirms the plane is not in the airport' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

  end
  context 'when conditions are poor' do
    it 'prevents take off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(weather).to receive(:stormy?) { false }
      airport.land(plane)
      allow(weather).to receive(:stormy?) { true }
      error = 'Take off not permited due to poor weather conditions'
      expect { subject.take_off(plane) }.to raise_error error
    end
  end

end
