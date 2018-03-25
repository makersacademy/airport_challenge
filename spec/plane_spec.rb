require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { instance_double('Airport') }

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'changes status to :landed if landing was successful' do
      allow(airport).to receive(:accept_plane).with(subject).and_return(true)
      subject.land airport
      expect(plane.status).to eq :landed
    end
    
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off) }
  end
end
