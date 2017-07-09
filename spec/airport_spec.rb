require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before { allow(subject).to receive(:stormy?).and_return false }

  it { is_expected.to respond_to :capacity }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  it 'should enable planes to land' do
    expect { subject.land(plane) }.not_to raise_error
  end

  it 'should enable planes to take-off' do
    subject.land(plane)
    expect { subject.takeoff(plane) }.not_to raise_error
  end

  it 'should not allow take-off for planes that were not landed here' do
    expect { subject.takeoff(plane) }.to raise_error 'Error. Unregistered plane can\'t take-off.'
  end

  it 'should prevent landing when the airport is full' do
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Negative. Airport is full.'
  end

  it 'should count arriving/departing planes properly' do
    subject.capacity.times { subject.land(plane) }
    subject.takeoff(plane)
    expect { subject.land(plane) }.not_to raise_error
  end

  context 'custom capacity' do
    before { @test_capacity = rand(100) }

    it 'expected to reveal its custom capacity' do
      airport = described_class.new(@test_capacity)
      expect(airport.capacity).to eq @test_capacity
    end

    it 'expected to receive a number of planes according to capacity' do
      airport = described_class.new(@test_capacity)
      allow(airport).to receive(:stormy?).and_return false
      @test_capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Negative. Airport is full.'
    end
  end

  context 'stormy weather' do
    before { allow(subject).to receive(:stormy?).and_return true }

    it 'prevents take-off' do
      expect { subject.takeoff plane }.to raise_error 'Negative. Cancel take-off due to weather conditions.'
    end

    it 'prevents landing' do
      expect { subject.land plane }.to raise_error 'Negative. Cancel landing due to weather conditions.'
    end
  end
end
