require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before { allow(subject).to receive(:stormy?).and_return false }

  it { is_expected.to respond_to :capacity }
  it { is_expected.to respond_to :landing_clear? }
  it { is_expected.to respond_to :takeoff_clear? }
  it { is_expected.to respond_to :checkin }
  it { is_expected.to respond_to :checkout }

  it 'allows landing' do
    expect(subject.landing_clear?).to be true
  end

  it 'allows take-off' do
    expect(subject.takeoff_clear?).to be true
  end

  it 'should prevent landing when the airport is full' do
    subject.capacity.times { subject.checkin(plane) }
    expect { subject.landing_clear? }.to raise_error 'Negative. Airport is full.'
  end

  context 'custom capacity' do
    before { @test_capacity = rand(100) }

    it 'expected to reveal its custom capacity' do
      airport = described_class.new(@test_capacity)
      expect(airport.capacity).to eq @test_capacity
    end

    it 'expected to receive a number of planes according to capacity' do
      airport = described_class.new(@test_capacity)
      @test_capacity.times { airport.checkin(plane) }
      expect { airport.landing_clear? }.to raise_error 'Negative. Airport is full.'
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
