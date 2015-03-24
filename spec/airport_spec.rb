require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before do
    allow(plane).to receive(:land!)
    allow(plane).to receive(:fly!)
    it { is_expected.to respond_to :land_plane }
  end

  context ' land and fly' do
    it ' can fly in good weather' do
      subject.land_plane(plane)
      expect(subject.plane_fly(plane)).to eq plane
    end

    it ' can land in good weather ' do
      expect(subject.land_plane(plane)).to eq [plane]
    end
  end

  context 'traffic control' do
    it 'can return planes' do
      expect(subject.planes).to eq []
    end

    it 'plane can not land if the airport is full' do
      6.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error 'No Space'
    end

    it 'plane can not go if there is no plane' do
      expect { subject.plane_fly(plane) }.to raise_error 'No Planes'
    end
  end
end
