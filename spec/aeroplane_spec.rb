#!/usr/bin/env ruby

require 'aeroplane'

describe Aeroplane do

  let(:airport) do
    airport = double(:airport)
    allow(airport).to receive(:clear_landing)
    allow(airport).to receive(:clear_take_off)
    allow(airport).to receive(:register_arrival)
    allow(airport).to receive(:register_departure)
    airport
  end

  describe "creates with" do
    context "airport" do
      it { is_expected.to respond_to :airport }

      it "is nil by default" do
        expect(subject.airport).to be_nil
      end

      it "is object when passed" do
        subject = described_class.new(:airport)
        expect(subject.airport).to eq :airport
      end
    end
  end

  describe "#flying?" do
    context "knows when flying" do
      it "when flying" do
        expect(subject).to be_flying
      end

      it "when grounded" do
        subject = described_class.new(:airport)
        expect(subject).to_not be_flying
      end
    end
  end

  describe "#is_flying_check" do
    context "depending on location" do
      it "raises error (if flying)" do
        expect { subject.is_flying_check }.to raise_error AeroplaneError 
      end

      it "does nothing (if flying)" do
        subject = described_class.new(:airport)
        expect { subject.is_flying_check }.to_not raise_error AeroplaneError 
      end
    end
  end

  describe "#is_grounded_check" do
    context "depending on location" do
      it "raises error (if grounded)" do
        subject = described_class.new(:airport)
        expect { subject.is_grounded_check }.to raise_error AeroplaneError 
      end

      it "does nothing (if flying)" do
        expect { subject.is_grounded_check }.to_not raise_error AeroplaneError 
      end
    end
  end

  describe "#land" do
    context "lands at an airport" do
      it "sets @airport to passed value" do
        subject.land(airport)
        expect(subject.airport).to eq airport
      end
    end
      
    context "interacts with airport" do
      it "gets permission from airport" do
        expect(airport).to receive(:clear_landing)
        subject.land(airport)
      end

      it "registers with airport" do
        expect(airport).to receive(:register_arrival).with(subject)
        subject.land(airport)
      end
    end
    
    context "checks if already landed" do
      it "checks if flying" do
        expect(subject).to receive(:is_grounded_check)
        subject.land(airport)
      end
    end
  end

  describe "#take_off" do

    subject { described_class.new(airport) }

    context "leaves airport" do
      it "sets @airport to nil" do
        subject.take_off
        expect(subject.airport).to be_nil
      end
    end
      
    context "interacts with airport" do
      it "gets permission from airport" do
        expect(airport).to receive(:clear_take_off)
        subject.take_off
      end

      it "registers with airport" do
        expect(airport).to receive(:register_departure).with(subject)
        subject.take_off
      end
    end

    context "checks if already landed" do
      it "checks if grounded" do
        expect(subject).to receive(:is_flying_check)
        subject.take_off
      end
    end
  end
end
