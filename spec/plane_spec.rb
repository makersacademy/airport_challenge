require 'plane'
require 'airport'

describe Plane do

  subject(:plane) {described_class.new}

  # describe '#initialize' do
  #   it 'sets plane status to inflight' do
  #     subject
  #     expect(subject).to have_attributes(@status => :in_flight)
  #   end
  # end

  # describe '#land' do
  #   it 'changes status to landed' do
  #     subject.land
  #     expect(subject).to have_attributes(@status => :in_flight)
  #   end
  # end

  end

  # let(:airport) {double :airport}
  # describe '#land' do
  #   it 'lands a plane when instructed to' do
  #     subject.clearance_from_airport == true
  #     subject.land
  #     expect(subject.status).to eq :landed
  #   end
  #   it 'cannot land if there is no clearance' do
  #     allow(plane).to receive(:clearance_for_landing).and_return(:false)
  #     expect{subject.land}.to raise_error "Clearance for landing not granted"
  #   end
  # end
