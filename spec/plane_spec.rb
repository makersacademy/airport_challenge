require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { instance_double('Airport') }

  it "plane is initialized as ':landed' " do
    expect(subject.status).to eq :landed
  end

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'changes status to :landed if landing was successful' do
      allow(airport).to receive(:accept_plane).with(subject).and_return(true)
      subject.land airport
      expect(subject.status).to eq :landed
    end
    
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off) }

    it 'changes status to :in_air if take off was successful' do
      allow(airport).to receive(:release_plane).with(subject).and_return(true)
      subject.take_off airport
      expect(subject.status).to eq :in_air
    end
  end
end
