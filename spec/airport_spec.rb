
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:another_plane) { double :plane }

  context 'runway/terminal initialisation' do
    it 'sets capacity and does not allow planes in past capacity' do
      allow(airport).to receive(:stormy?).and_return false
      Runway.class_variable_set :@@runway_traffic, [plane, plane, plane, plane, plane]
      expect { subject.land another_plane }.to raise_error "We're too full - go land somewhere else!"
    end
  end

  context 'runway/terminal basic operation' do

    it 'allow a plane to #land on a runway' do
      allow(airport).to receive(:stormy?).and_return false
      subject.land plane
      expect(subject.runway_traffic).to include plane
    end

    it 'allow a plane to *simply* #take_off from airport and offer plane as return value' do
      allow(airport).to receive(:stormy?).and_return false
      subject.land plane
      expect(subject.take_off plane).to eq plane
    end

    it 'checks that *correct* plane has taken off from airport' do
      allow(airport).to receive(:stormy?).and_return false
      Runway.class_variable_set :@@runway_traffic, [plane, another_plane]
      expect(subject.take_off another_plane).to eq another_plane
    end

    # note for README: this means return value of take_off is the plane itself... is that what we want, or is nil what we want? need to bear this in mind for future extensibility in case someone expects something else like nil or array

    it 'allow a plane to #take_off from airport and no longer be on the runway' do
      allow(airport).to receive(:stormy?).and_return false
      subject.take_off plane
      expect(subject.runway_traffic).not_to include plane
    end

  end

  context 'stormy weather for landing' do

    it 'DISallow a plane to #take_off if it IS stormy' do
      allow(airport).to receive(:stormy?).and_return true
      storm_warning = "Storm! Do not take off!"
      subject.runway_traffic << plane
      expect { subject.take_off(plane) }.to raise_error storm_warning
    end

    # Consider refactoring the above for more elegant way to allow runway to contain a plane before takeoff

    it 'allow a plane to #take_off if it is NOT stormy' do
      allow(airport).to receive(:stormy?).and_return false
      expect { subject.take_off(plane) }.not_to raise_error
    end

    it 'DISallow a plane to #land if it IS stormy' do
      allow(airport).to receive(:stormy?).and_return true
      storm_warning = "Storm! Do not land here!"
      expect { subject.land(plane) }.to raise_error storm_warning
    end

    it 'allow a plane to #land if it is NOT stormy' do
      allow(airport).to receive(:stormy?).and_return false
      expect { subject.take_off(plane) }.not_to raise_error
    end

  end

end
