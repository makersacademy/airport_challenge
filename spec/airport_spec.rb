require 'airport'

describe Airport do
  it { is_expected.to respond_to :weather}
  it { is_expected.to respond_to :capacity}
  it { is_expected.to respond_to :planes}
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :takeoff}

  let(:plane) { double(:plane, land: true, takeoff: true)}
  let(:groundplane) { double(:plane, land: true, takeoff: true, ground: true)}
  let(:flyplane) { double(:plane, land: true, takeoff: true, ground: false)}

  describe '#weather' do
    it 'generates the current weather when a plane is attempting to take off' do
      allow(subject).to receive(:rand) {5}
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.weather).to eq "Sunny"
    end
  end

  describe '#capacity' do
    it 'prevents landing when the airport capacity is full' do
      allow(subject).to receive(:rand) {5}
      subject.capacity.times {subject.land(plane)}
      expect {subject.land(plane) }.to raise_error("The airport is full")
    end

    it 'allows for capacity to be changed when creating a new airport' do
      ap = Airport.new(3)
      allow(ap).to receive(:rand) {5}
      3.times {ap.land(plane)}
      expect(ap.planes).to eq [plane,plane,plane]
    end
  end

  describe '#planes' do
    it 'returns what planes are currently at the airport' do
      allow(subject).to receive(:rand) {5}
      3.times {subject.land(plane)}
      expect(subject.planes).to eq [plane,plane,plane]
    end
  end
  describe '#land' do
    it 'allows planes to land' do
      allow(subject).to receive(:rand) {5}
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'raises an error when a plane tried to land and the weather is stormy' do
      allow(subject).to receive(:rand) {20}
      expect {subject.land(flyplane)}.to raise_error("Planes cannot land due to stormy weather")
    end
  end

  describe '#takeoff' do
    it 'allows planes to takeoff' do
      allow(subject).to receive(:rand) {5}
      pl = Plane.new
      subject.land(pl)
      subject.land(plane)
      subject.takeoff(pl)
      expect(subject.planes).to eq [plane]
    end

    it 'raises an error when a plane tries to takeoff and the weather is stormy' do
      allow(subject).to receive(:rand) {5}
      subject.land(groundplane)
      allow(subject).to receive(:rand) {20}
      expect {subject.takeoff(groundplane)}.to raise_error("Planes cannot take off due to stormy weather")
    end

    it 'raises an error when there are no planes to take off' do
      allow(subject).to receive(:rand) {5}
      expect {subject.takeoff(plane)}.to raise_error("There are no planes at the airport")
    end
  end
end
