require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { instance_double Plane }

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has got landed plane at the airport' do
      expect(subject.land(plane)).to include plane
    end

    it 'raises error if airport is full' do
      50.times {subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error 'airport is full'
    end

    it 'raises error if plane already landed' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'this plane has already landed'
    end

=begin
    it 'prevents landed plane to land again on different airport' do
      airport_1 = Airport.new
      airport_2 = Airport.new
      airport_1.land(plane)
      expect { airport_2.land(plane) }.to raise_error 'this plane has already landed'
    end
=end
  end

  context "#reports status" do
      it 'reports status of the plane' do
      expect(subject.report_status).to eq "Plane no longer at the airport"
    end

  end

  context "#planes" do
    it 'shows landed planes' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  context "#capacity" do
    it { is_expected.to respond_to(:capacity) }

    it 'sets capacity to default value' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'lets plane to takeoff' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'raises error if there are no planes to take off' do
      expect { subject.takeoff(plane) }.to raise_error 'there are no planes at the airport'
    end

  end
end
