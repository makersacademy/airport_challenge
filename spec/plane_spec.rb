require 'plane'

describe Plane do

  subject(:plane) { Plane.new }
  subject(:grounded_plane) { Plane.new("ground") }

  let(:airport) { double('airport') }

  describe 'plane has adequate status information' do
    it 'initializes with status set to flying' do
      expect(plane.status).to eq "flying"
    end

    before do
      allow(airport).to receive(:request) { true }
    end

    it 'changes status to ground after landing' do
      plane.land(airport)
      expect(plane.status).to eq "ground"
    end

    it 'changes status to flying after take off' do
      grounded_plane.take_off(airport)
      expect(grounded_plane.status).to eq "flying"
    end

  end

end
