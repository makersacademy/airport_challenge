require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before { allow(subject).to receive(:stormy?).and_return false }

  it { is_expected.to respond_to :capacity }
  it { is_expected.to respond_to :landing_clear? }
  it { is_expected.to respond_to :takeoff_clear? }
  it { is_expected.to respond_to :plane_arrived }
  it { is_expected.to respond_to :plane_left }

  it 'allows landing' do
    expect(subject.landing_clear?).to be true
  end

  it 'allows take-off' do
    expect(subject.takeoff_clear?).to be true
  end

  it 'should prevent landing when the airport is full' do
    subject.capacity.times { subject.plane_arrived(plane) }
    expect { subject.landing_clear? }.to raise_error 'Negative. Airport is full.'
  end

  context 'custom capacity' do
    before { @test_capacity = rand(100) }
    it 'expected to reveal its custom capacity' do
      airport = described_class.new(@test_capacity)
      expect(airport.capacity).to eq @test_capacity
    end
  end

  context 'stormy weather' do
    before { allow(subject).to receive(:stormy?).and_return true }

    it 'prevents take-off' do
      expect { subject.takeoff_clear? }.to raise_error 'Negative. Cancel take-off because of the weather.'
    end

    it 'prevents landing' do
      expect { subject.landing_clear? }.to raise_error 'Negative. Cancel landing because of the weather.'
    end
  end
end
