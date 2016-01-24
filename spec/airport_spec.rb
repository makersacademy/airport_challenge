require 'airport'
require_relative 'plane_container_spec'

describe Airport do
  subject(:Airport) {described_class.new}
	let(:plane) { double :plane }
  let(:control) { double :control }

  it_behaves_like PlaneContainer

  #responds to methods in class
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  # #list_planes is made up of planes
  # describe 'list_planes' do
  #   it 'are planes' do
  #     subject.land(plane)
  #     expect(subject.airport_planes.pop).to be_an_instance_of(Airplane)
  #   end
  # end

#wrap in reporting condition
  describe 'stub conditions to allow plane reporting' do
    before do
      allow(plane).to receive(:report_landed)
      allow_any_instance_of(Airport).to receive(:report_landed)
      allow(plane).to receive(:report_inflight)
      allow_any_instance_of(Airport).to receive(:report_inflight)
    end

    #land docks plane in airport
    describe '#land' do
      it 'check plane in airport' do
        subject.land(plane)
        expect(subject.airport_planes).to include(plane)
      end
    end

    describe '#land' do
      it 'calls report_landed' do
        expect(plane).to receive(:report_landed)
        subject.land(plane)
      end
    end

    #takeoff releases plane from airport
    describe '#takeoff' do
      it 'returns plane removed from airport' do
        subject.land(plane)
        expect(subject.takeoff(plane)).to eq plane
      end
    end

    describe '#takeoff' do
      it 'check plane no longer at airport' do
        subject.land(plane)
        subject.takeoff(plane)
        expect(subject.airport_planes).not_to include(plane)
      end
    end

    describe '#takeoff' do
      it 'calls report_inflight' do
        expect(plane).to receive(:report_inflight)
        subject.takeoff(plane)
      end
    end
  end
end
