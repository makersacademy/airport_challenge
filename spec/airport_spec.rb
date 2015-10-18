require 'airport'

describe Airport do
  let(:plane) {double(:plane, :flying => true)}
  let(:bad_airport){Airport.new}

  it 'allows planes to land' do
    allow(subject).to receive(:stormy?) {false}
    expect(subject.land(plane)).to eq([plane])
  end

  it 'allows planes to takeoff' do
    allow(subject).to receive(:stormy?) {false}
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq(plane)
  end

  describe '#land' do
    it 'prevents planes landing when airport is full' do
      allow(subject).to receive(:stormy?) {false}
      10.times{subject.land(Plane.new)}
      expect{subject.land(plane)}.to raise_error("This airport is full")
    end
    let(:plane2) {double(:plane2, :flying => false)}
    it 'prevents landed planes from landing again' do
      allow(subject).to receive(:stormy?) {false}
      expect{subject.land(plane2)}.to raise_error("This plane is landed")
    end
  end

  let(:plane1){double(:plane1, :flying => true)}
  it "prevents use when stormy" do
    allow(subject).to receive(:stormy?) {false}
    subject.land(plane1)
    allow(subject).to receive(:stormy?) {true}
    expect{subject.land(plane)}.to raise_error("It is stormy")
    expect{subject.takeoff(plane1)}.to raise_error("It is stormy")
  end

  describe '#takeoff' do
    it 'only allow planes at the airport to takeoff' do
      allow(subject).to receive(:stormy?) {false}
      subject.land(plane)
      expect(bad_airport.takeoff(plane)).to be nil
      expect(subject.planes.last).to eq(subject.takeoff(plane))
    end

    it 'does not allow flying planes to takeoff' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.takeoff(plane)).to eq nil
    end

    it 'makes sure the plane has left the airport' do
      subject.land(plane)
      expect(subject.takeoff(plane)).not_to eq (:planes)
    end
  end

  it 'does not store flying planes' do
    allow(subject).to receive(:stormy?) {false}
    subject.land(plane)
    expect(subject.takeoff(plane)).not_to eq(subject.takeoff(plane))
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'capacity can be overridden' do
    expect(subject.new_capacity = 40).to eq(subject.capacity)
  end
end
