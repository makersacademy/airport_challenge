require 'airport'

describe Airport do
  let(:plane) { double('plane', :in_flight? => true) }
  before { allow(subject).to receive(:stormy?).and_return false }

  it { is_expected.to respond_to :capacity }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  it 'should enable planes to land' do
    expect { subject.land(plane) }.not_to raise_error
  end

  it 'should enable planes to take-off' do
    subject.land(plane)
    allow(plane).to receive(:in_flight?).and_return false
    allow(plane).to receive(:landed_at?).and_return true
    expect { subject.takeoff(plane) }.not_to raise_error
  end

  it 'should not allow landing unless the plane is in flight' do
    subject.land(plane)
    allow(plane).to receive(:in_flight?).and_return false
    expect { subject.land(plane) }.to raise_error "Error. This plane is not in flight, we can\'t land it."
  end

  it 'should not allow take-off unless the plain is landed in the airport' do
    subject.land(plane)
    allow(plane).to receive(:in_flight?).and_return false
    allow(plane).to receive(:landed_at?).and_return true
    subject.takeoff(plane)
    allow(plane).to receive(:in_flight?).and_return true
    allow(plane).to receive(:landed_at?).and_return false
    expect { subject.takeoff(plane) }.to raise_error "Error. This plane is in flight therefore can\'t take-off."
  end

  it 'should prevent landing when the airport is full' do
    subject.capacity.times {
      plane = double :plane
      allow(plane).to receive(:in_flight?).and_return true
      subject.land(plane)
    }
    expect { subject.land(plane) }.to raise_error 'Negative. Airport is full.'
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
        allow(plane).to receive(:in_flight?).and_return true
        airport.land(plane)
      }
      expect { airport.land(plane) }.to raise_error 'Negative. Airport is full.'
    end
  end

  context 'stormy weather' do
    before { allow(subject).to receive(:stormy?).and_return true }

    it 'prevents take-off' do
      allow(plane).to receive(:in_flight?).and_return false
      allow(plane).to receive(:landed_at?).and_return true
      expect { subject.takeoff plane }.to raise_error 'Negative. Cancel take-off because of the weather.'
    end

    it 'prevents landing' do
      expect { subject.land plane }.to raise_error 'Negative. Cancel landing because of the weather.'
    end
  end
end
