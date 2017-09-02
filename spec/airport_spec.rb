
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  context 'runway/terminal basic operation' do

    it 'allow a plane should be able to #land on a runway' do
      subject.land plane
      expect(subject.runway_traffic).to include plane

    end

    it 'allow a plane to #take_off from airport and no longer be on the runway' do
      allow(airport).to receive(:stormy?).and_return false
      subject.take_off plane
      expect(subject.runway_traffic).not_to include plane
    end

  end

  context 'stormy weather for landing' do
    it 'disallow a plane to #take_off if it is stormy' do
      allow(airport).to receive(:stormy?).and_return true
      storm_warning = "Storm! Do not take off!"
      expect{subject.take_off(plane)}.to raise_error storm_warning
    end

    it 'disallow a plane to #take_off if it is stormy' do
      allow(airport).to receive(:stormy?).and_return false
      storm_warning = "Storm! Do not take off!"
      expect{subject.take_off(plane)}.not_to raise_error storm_warning
    end

  end


end
