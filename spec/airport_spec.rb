require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before { allow(subject).to receive(:stormy?).and_return false }

  it { is_expected.to respond_to :capacity }
  it { is_expected.to respond_to :landing_clear? }
  it { is_expected.to respond_to :takeoff_clear? }
  it { is_expected.to respond_to :checkin }
  it { is_expected.to respond_to :checkout }

  it 'should give clear for landing' do
    expect(subject.landing_clear?).to be true
  end

  it 'should give clear for take-off' do
    expect(subject.takeoff_clear?).to be true
  end

  it 'should not allow to check-in planes that are already checked in' do
    subject.checkin(plane)
    expect { subject.checkin(plane) }.to raise_error 'Error. This plane is already checked in.'
  end

  it 'should not allow to checkout planes that are not checked in' do
    subject.checkin(plane)
    subject.checkout(plane)
    expect { subject.checkout(plane) }.to raise_error 'Error. This plane has not been checked in.'
  end

  it 'should prevent landing when the airport is full' do
    subject.capacity.times {
      plane = double :plane
      subject.checkin(plane)
    }
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
      allow(airport).to receive(:stormy?).and_return false
      @test_capacity.times {
        plane = double :plane
        airport.checkin(plane)
      }
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
