
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  context 'airport runway/terminals' do

    it 'a plane should be able to #land on a runway' do
      subject.land plane
      expect(subject.runway_traffic).to include plane

    end

    it 'a plane should be able to #take_off from airport and no longer be on the runway' do
      subject.take_off plane
      expect(subject.runway_traffic).not_to include plane
    end

    it 'a plane should not #take_off if it is stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect(subject.take_off plane).to eq "Storm!"
    end

    it 'a plane to #take_off if it is NOT stormy' do
      allow(airport).to receive(:stormy?).and_return false
      subject.take_off plane
      expect(subject.runway_traffic).to include plane
    end

  end


end
