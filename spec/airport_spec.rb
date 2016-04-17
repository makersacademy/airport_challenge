require 'airport'

describe Airport do
  it { is_expected.to respond_to :capacity}
  it { is_expected.to respond_to :planes}
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :takeoff}
  it { is_expected.to respond_to :weather_check}

  let(:plane) { double(:plane, land: true, takeoff: true, ground: false)}
  let(:groundplane) { double(:plane, land: true, takeoff: true, ground: true)}
  let(:flyplane) { double(:plane, land: true, takeoff: true, ground: false)}

  describe '#capacity' do
    it 'prevents landing when the airport capacity is full' do
      allow(subject).to receive(:weather_check).and_return(true)
      subject.capacity.times {subject.land(flyplane)}
      expect {subject.land(flyplane)}.to raise_error("The airport is full")
    end

    it 'allows for capacity to be changed when creating a new airport' do
      ap = described_class.new(3)
      allow(ap).to receive(:weather_check).and_return(true)
      3.times {ap.land(flyplane)}
      expect(ap.planes).to eq [flyplane,flyplane,flyplane]
    end
  end

  describe '#planes' do
    it 'returns what planes are currently at the airport' do
      allow(subject).to receive(:weather_check).and_return(true)
      3.times {subject.land(flyplane)}
      expect(subject.planes).to eq [flyplane,flyplane,flyplane]
    end
  end

  describe '#land' do
    it 'allows planes to land' do
      allow(subject).to receive(:weather_check).and_return(true)
      subject.land(flyplane)
      expect(subject.planes).to eq [flyplane]
    end



    it 'only allows a plane to land if it is currently flying' do
      allow(subject).to receive(:weather_check).and_return(true)
      no_fly = "This plane is not in the air"
      expect {subject.land(groundplane)}.to raise_error(no_fly)
    end
  end

  describe '#takeoff' do
    it 'allows planes to takeoff' do
      allow(subject).to receive(:weather_check).and_return(true)
      subject.land(flyplane)
      subject.land(plane)
      subject.takeoff(flyplane)
      expect(subject.planes).to eq [plane]
    end

    it 'raises an error when there are no planes to take off' do
      allow(subject).to receive(:weather_check).and_return(true)
      no_planes = "There are no planes at the airport"
      expect {subject.takeoff(plane)}.to raise_error(no_planes)
    end

    it 'only allows planes to take off if they parked there' do
      port1 = described_class.new
      port2 = described_class.new
      allow(port1).to receive(:weather_check).and_return(true)
      allow(port2).to receive(:weather_check).and_return(true)
      no_plane = "That plane is not at this airport"
      port1.land(plane)
      port2.land(flyplane)
      expect {port2.takeoff(plane)}.to raise_error(no_plane)
    end
  end
  describe "#weather" do
    it "returns nothing if the weather is fine" do
      allow(Weather).to receive(:weather_calc).and_return(nil)
      expect(subject.weather_check(plane)).to eq(nil)
    end
  end
end
