require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { instance_double('Airport') }
  
  before do
    allow(airport).to receive_messages(:release_plane => true, :add_plane => true, :accept_plane => true)
  end

  it "plane is initialized as :new " do
    expect(subject.status).to eq :new
  end

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'throws an error if already landed' do
      allow(subject).to receive(:status).and_return(:landed)
      expect { subject.land airport }.to raise_error 'Plane not in air'
    end

    it 'changes status to :landed if landing was successful' do
      expect(subject.new_to_landed(airport).take_off(airport).land(airport).status).to eq :landed
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'throws an error if already in air' do
      allow(subject).to receive(:status).and_return(:in_air)
      expect { subject.take_off airport }.to raise_error 'Plane not landed'
    end

    it 'changes status to :in_air if take off was successful' do
      expect(subject.new_to_landed(airport).take_off(airport).status).to eq :in_air
    end
  end
end
