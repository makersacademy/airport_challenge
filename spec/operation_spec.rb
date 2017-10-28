#!/usr/bin/env ruby

require 'operation'
require 'air_exceptions'

describe Operation do

  subject { described_class.new(airport) }

  let(:airport) do
    airport = double(:airport)
    allow(airport).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:full?).and_return(false)
    airport
  end

  describe "creates with" do
    context "airport" do
      it { is_expected.to respond_to :airport }

      it "contains passed airport object" do
        expect(subject.airport).to eq airport
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
        expect(subject).to receive(:dock)
        subject.to(:dock)
      end

      it "checks landing" do
        expect(subject).to receive(:land)
        subject.to(:land)
      end

      it "checks taking off" do
        expect(subject).to receive(:take_off)
        subject.to(:take_off)
      end
    end
  end

  describe "#capacity_check" do
    context "checks airport capacity" do
      it "raises error if full" do
        expect(airport).to receive(:full?).and_return(true)
        expect { subject.capacity_check }.to raise_error AirportError
      end

      it "does nothing if not full" do
        expect(airport).to receive(:full?).and_return(false)
        expect(subject.capacity_check).to eq true
      end
    end
  end

  describe "#weather_check" do
    context "checks airport weather" do
      it "raises error if full" do
        expect(airport).to receive(:stormy?).and_return(true)
        expect { subject.weather_check }.to raise_error AirportError
      end

      it "returns true if not full" do
        expect(airport).to receive(:stormy?).and_return(false)
        expect(subject.weather_check).to eq true
      end
    end
  end

  describe "#dock" do
    context "makes capacity check" do
      it "calls capacity check" do
        expect(subject).to receive(:capacity_check)
        subject.dock
      end
    end
  end

  describe "#land" do
    context "makes capacity and weather check" do
      it "calls capacity check" do
        expect(subject).to receive(:capacity_check)
        subject.land
      end

      it "calls #weather_check" do
        expect(subject).to receive(:weather_check)
        subject.land
      end
    end
  end

  describe "#take_off" do
    context "makes weather check" do
      it "calls #weather_check" do
        expect(subject).to receive(:weather_check)
        subject.land
      end
    end
  end
end
