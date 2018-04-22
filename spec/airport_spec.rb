require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { instance_double Plane }
  let(:flying_plane_1) { instance_double Plane, flying: true }
  let(:flying_plane_2) { instance_double Plane, flying: true }
  let(:landed_plane) { instance_double Plane, landing: false }
  let(:good_weather) { instance_double Weather, stormy?: false }
  let(:stormy_weather) { instance_double Weather, stormy?: true }

  describe "#land" do

    it 'has got landed plane at the airport' do
      subject.land(flying_plane_1, good_weather)
      expect(subject.planes).to include flying_plane_1
    end

    it 'raises error if airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new, good_weather) }
      expect { subject.land(flying_plane_1, good_weather) }.to raise_error 'airport is full'
    end

    it 'raises error if plane already landed' do
      subject.land(flying_plane_1, good_weather)
      expect { subject.land(flying_plane_1, good_weather) }.to raise_error 'this plane has already landed'
    end

  end

  context "#planes" do
    it 'shows landed planes' do
      subject.land(flying_plane_1, good_weather)
      expect(subject.planes).to eq [flying_plane_1]
    end
  end

  context "#capacity" do
    it { is_expected.to respond_to(:capacity) }

    it 'sets capacity to default value' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe "#takeoff" do

    it { is_expected.to respond_to(:takeoff).with(2).arguments }

    class Airport
      attr_writer :planes
    end

    it 'lets plane to takeoff' do
      subject.planes = [landed_plane]
      expect(subject.takeoff(landed_plane, good_weather)).to eq landed_plane
    end

    it 'raises error if there are no planes to take off' do
      expect { subject.takeoff(landed_plane, good_weather) }.to raise_error 'there are no planes at the airport'
    end
  end

  context "#reports status" do
    class Airport
      attr_writer :planes
    end

    it 'reports status of the plane when took off' do
      subject.planes = [landed_plane]
      subject.takeoff(landed_plane, good_weather)
      expect(subject.report_status).to eq 'plane no longer at the airport'
    end
  end

  context "#weather" do
    it 'checks for stormy weather' do
      expect(subject.bad_weather?(stormy_weather)).to eq true
    end
    it 'raises error if bad weather and plane wants to land' do
      expect { subject.land(flying_plane_1, stormy_weather) }.to raise_error 'bad weather conditions, airport closed'
    end
    it 'raises error if bad weather and plane wants to take off' do
      expect { subject.takeoff(landed_plane, stormy_weather) }.to raise_error 'bad weather conditions, airport closed'
    end
  end
end
