require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { instance_double Plane }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to(:capacity) }

  describe "#land" do
    it 'adds landed plane' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises error if airport is full' do
      50.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error 'airport is full'
    end
  end

  context "#plane" do
    it 'shows landed planes' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe "#takeoff" do
    it 'lets plane to takeoff' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end
  end

end
