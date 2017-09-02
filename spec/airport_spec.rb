
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  context 'runway/terminal basic operation' do

    it 'allow a plane to #land on a runway' do
      allow(airport).to receive(:stormy?).and_return false
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
    it 'DISallow a plane to #take_off if it IS stormy' do
      allow(airport).to receive(:stormy?).and_return true
      storm_warning = "Storm! Do not take off!"
      subject.runway_traffic << plane
      expect { subject.take_off(plane) }.to raise_error storm_warning
    end

    #Consider refactoring the above for more elegant way to allow runway to contain a plane before takeoff

    it 'allow a plane to #take_off if it is NOT stormy' do
      allow(airport).to receive(:stormy?).and_return false
      storm_warning = "Storm! Do not take off!"
      expect { subject.take_off(plane) }.not_to raise_error storm_warning
    end

    it 'DISallow a plane to #land if it IS stormy' do
      allow(airport).to receive(:stormy?).and_return true
      storm_warning = "Storm! Do not land here!"
      expect { subject.land(plane) }.to raise_error storm_warning
    end

    it 'allow a plane to #land if it is NOT stormy' do
      allow(airport).to receive(:stormy?).and_return false
      storm_warning = "Storm! Do not land here!"
      expect { subject.take_off(plane) }.not_to raise_error storm_warning
    end

  end



  context 'airport runway approach/depart' do

    it 'a plane should respond that it is on the ground when on the runway' do
      subject.runway_traffic << plane
      # Places subject plane in runway
      expect(subject.report_status plane).to eq "I'm on the ground!"
    end

    it 'a plane should respond that it is in the air when not on the runway' do

      # Tests an empty runway
      expect(subject.report_status plane).to eq "I'm in the air!"
    end

  end


end
