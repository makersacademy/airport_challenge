#!/usr/bin/env ruby

require 'operation'
require 'air_exceptions'

describe Operation do

  subject { described_class.new(plane) }

  let(:plane) do
    plane = double(:plane)
    allow(plane).to receive(:airport).and_return(:airport)
    plane
  end

  let(:airport) do
    airport = double(:airport)
    allow(airport).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:full?).and_return(false)
    airport
  end

  describe "creates with" do
    context "aeroplane" do
      it { is_expected.to respond_to :aeroplane }

      it "contains passed aeroplane object" do
        expect(subject.aeroplane).to eq plane
      end
    end
  end

  describe "#able_to?" do
    context "knows whether operations are permitted" do
      it "recognises permitted operation" do
        expect(subject).to be_able_to :land
      end
      
      it "doesn't know unexpected operation" do
        expect(subject).to_not be_able_to :nothing
      end
    end
  end

  describe "#to" do
    context "checks for unsupported operation" do
      it "raises error if failing able_to?" do
        expect(subject).to receive(:able_to?).and_return(false)
        expect { subject.to(:nothing) }.to raise_error ArgumentError
      end
    end

    context "knows what to do with actions" do
      it "checks docking" do
        expect(subject).to receive(:dock).with(:somewhere)
        subject.to(:dock, :at => :somewhere)
      end

      it "checks landing" do
        expect(subject).to receive(:land).with(:somewhere)
        subject.to(:land, :at => :somewhere)
      end

      it "checks taking off" do
        expect(subject).to receive(:take_off).with(:airport)
        subject.to(:take_off)
      end
    end
  end

  describe "#dock" do
    context "checks airport capacity" do
      it "raises error if full" do
        expect(airport).to receive(:full?).and_return(true)
        expect { subject.dock(airport) }.to raise_error AirportError
      end
       
      it "does nothing if empty" do
        expect { subject.dock(airport) }.to_not raise_error
      end
    end
  end

  describe "#land" do
    context "checks airport capacity and weather" do
      it "raises error if full" do
        expect(airport).to receive(:full?).and_return(true)
        expect { subject.land(airport) }.to raise_error AirportError
      end

      it "raises error if stormy" do
        expect(airport).to receive(:stormy?).and_return(true)
        expect { subject.land(airport) }.to raise_error AirportError
      end
       
      it "does nothing if empty" do
        expect { subject.land(airport) }.to_not raise_error
      end
    end
  end

  describe "#take_off" do
    context "checks airport weather" do
      it "raises error if stormy" do
        expect(airport).to receive(:stormy?).and_return(true)
        expect { subject.take_off(airport) }.to raise_error AirportError
      end
       
      it "does nothing if empty" do
        expect { subject.take_off(airport) }.to_not raise_error
      end
    end
  end
end
