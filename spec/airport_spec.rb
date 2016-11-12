require './lib/airport'
require './lib/plane'

describe Airport do

  let(:plane) { double :plane }

  context 'landing a plane' do

    it { is_expected.to respond_to :land_plane }

    it 'creating an airport should create space for planes' do
      expect(subject.planes).to eq []
    end

    it 'instructs a plane to land' do
      allow(plane).to receive(:land_plane).and_return(plane)
      subject.land_plane(plane)
    end

    it 'has the plane after landing' do
      subject.land_plane(plane)
      expect(subject.planes).to eq [plane]
    end

  end

  context 'confirming plane has landed' do

    it { is_expected.to respond_to :confirm_plane_landing }

    it 'should confirm plane has landed once plane has landed' do
      expect(subject.land_plane(plane)).to eq "Plane #{plane} has landed"
    end

  end

end
