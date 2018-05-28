require 'airport'

describe Airport do
  planes = Plane.new
  let(:stormy) { double weather, stormy?: true }
  let(:not_stormy) { double weather, stormy?: false }

  describe '#land_plane' do
    it 'fails if the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land_plane(planes) }.to raise_error 'weather is stormy, cannot land plane'
    end
    it 'fails if the airport is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land_plane Plane.new }
      expect { subject.land_plane(planes) }.to raise_error 'airport is full'
    end
    it 'fails if plane is already landed at the airport' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land_plane(planes)
      expect { subject.land_plane(planes) }.to raise_error 'plane already landed'
    end
    it 'lands a plane' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject).to respond_to(:land_plane).with(1).argument
      expect(subject.land_plane(planes)).to include planes
    end
  end

  describe '#plane_depart' do
    it 'fails if the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.plane_depart(planes) }.to raise_error 'weather is stormy, cannot depart plane'
    end
    it 'fails if the plane is already in the air' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect { subject.plane_depart(planes) }.to raise_error 'plane is already in the air'
    end
    it 'instructs a plane to take off' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject).to respond_to(:plane_depart).with(1).argument
      subject.land_plane(planes)
      expect(subject.plane_depart(planes)).to eq planes
    end

  end
end
