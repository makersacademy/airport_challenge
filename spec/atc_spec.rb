#!/usr/bin/env ruby

require 'atc'

describe ATC do

  subject { described_class }

  let(:airport) { double(:airport) }  
  before(:each) { allow(airport).to receive(:stormy?).and_return(false) }
  before(:each) { allow(airport).to receive(:full?).and_return(false) }

  describe "#clear_docking" do
    it "raises error when at capacity" do
      allow(airport).to receive(:full?).and_return(true)
      expect { subject.clear_docking(airport) }.to raise_error AirportError
    end

    it "otherwise does nothing" do
      expect(subject.clear_docking(airport)).to be true
    end
  end

  describe "#clear_landing" do
    it "raises error for airport at capacity" do
      allow(airport).to receive(:full?).and_return(true)
      expect { subject.clear_landing(airport) }.to raise_error AirportError
    end

    it "raises error for airport at capacity" do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.clear_landing(airport) }.to raise_error AirportError
    end

    it "otherwise does nothing" do
      expect(subject.clear_landing(airport)).to be true
    end
  end

  describe "#clear_take_off" do
    it "raises error for airport at capacity" do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.clear_take_off(airport) }.to raise_error AirportError
    end

    it "otherwise does nothing" do
      expect(subject.clear_take_off(airport)).to be true
    end
  end
end
