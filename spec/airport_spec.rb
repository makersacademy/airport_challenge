require 'airport'

describe Airport do
  let(:plane) {double(:plane)}
  let(:plane1){double(:plane1)}
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
      subject.land(plane1)
      expect{subject.land(plane)}.to raise_error("This airport is full")
    end
  end

  it "prevents use when stormy" do
    subject.land(plane1)
    allow(subject).to receive(:stormy?) {true}
    expect{subject.land(plane)}.to raise_error("It is stormy")
    expect{subject.takeoff(plane1)}.to raise_error("It is stormy")
  end

  describe '#takeoff' do
    it 'only takeoff present planes' do
      allow(subject).to receive(:stormy?) {false}
      subject.land(plane)
      expect(bad_airport.takeoff(plane)).to be nil
      expect(subject.planes.last).to eq(subject.takeoff(plane))
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'capacity can be overridden' do
    expect(subject.new_capacity = 40).to eq(subject.capacity)
  end

end
