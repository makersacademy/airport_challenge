require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new}
  let(:plane) { :plane }

  describe '#arrive' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:arrive).with(1).argument
    end

    it 'confirms if plane is in the airport' do
      expect(airport.arrive(plane)).to eq plane
    end
  end

  describe '#depart' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:depart).with(1).argument
    end

    it 'confirms if plane is no longer in the airport' do
      expect(airport.depart(plane)).to eq 'The plane is no longer in the airport.'
    end
  end


end
