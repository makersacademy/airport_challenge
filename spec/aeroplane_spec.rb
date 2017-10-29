#!/usr/bin/env ruby

require 'aeroplane'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

describe Aeroplane do

  let(:airport) do
    airport = double(:airport)
    allow(airport).to receive(:process_landing)
    allow(airport).to receive(:process_docking)
    allow(airport).to receive(:process_take_off)
    airport
  end

  describe "creates with" do
    context "airport" do
      it { is_expected.to respond_to :airport }

      it "uses airport when passed one" do
        subject = described_class.new(at: airport)
        expect(subject.airport).to eq airport
      end
      
      it "docked at airport when passed one" do
        expect_any_instance_of(described_class)
          .to receive(:dock).with(airport)
        described_class.new(at: airport)
      end
    end

    context "name" do
      it { is_expected.to respond_to :name }

      it "is empty by default" do
        expect(subject.name).to be_nil
      end

      it "uses name when passed one" do
        subject = described_class.new(name: "hello")
        expect(subject.name).to eq "hello"
      end
    end
  end

  describe "#flying?" do
    context "knows when flying" do
      it "when flying" do
        expect(subject).to be_flying
      end

      it "when grounded" do
        subject = described_class.new(at: airport)
        expect(subject).to_not be_flying
      end
    end
  end

  describe "#land" do 
    context "checks if already landed" do
      it "no error if flying" do
        allow(subject).to receive(:flying?).and_return(true) 
        expect { subject.land(airport) }.to_not raise_error(AeroplaneError)
      end

      it "raises error if landed" do
        allow(subject).to receive(:flying?).and_return(false) 
        expect { subject.land(airport) }.to raise_error(AeroplaneError)
      end
    end

    context "register with airport" do
      it "calls airport process_landing" do
        expect(airport).to receive(:process_landing).with(subject)
        subject.land(airport)
      end
    end

    context "lands at an airport" do
      it "calls do_landing with airport" do
        expect(subject).to receive(:do_arrival).with(airport)
        subject.land(airport)
      end
    end
  end

  describe "#take_off" do
    subject { described_class.new(at: airport) }

    context "checks if already flying" do
      it "raises error if flying" do
        expect(subject).to receive(:flying?).and_return(true) 
        expect { subject.take_off }.to raise_error(AeroplaneError)
      end

      it "no error if landed" do
        expect(subject).to receive(:flying?).and_return(false) 
        expect { subject.take_off }.to_not raise_error(AeroplaneError)
      end
    end

    context "registers with airport" do
      it "calls airport #process_take_off" do
        expect(subject.airport).to receive(:process_take_off).with(subject)
        subject.take_off
      end
    end

    context "departs from an airport" do
      it "calls do_take_off" do
        expect(subject).to receive(:do_take_off)
        subject.take_off
      end
    end
  end

  describe "#to_s" do
    context "with named aeroplane" do
      it "starts with class and name" do
        subject = described_class.new(name: "hello")
        expect(subject.to_s).to start_with "Aeroplane (hello)"
      end
    end

    context "with unnamed aeroplane" do
      it "starts with class and 'unnamed'" do
        expect(subject.to_s).to start_with "Aeroplane (unnamed)"
      end
    end
  end
end
