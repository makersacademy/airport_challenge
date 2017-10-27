#!/usr/bin/env ruby

require 'aeroplane'

describe Aeroplane do
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
end
