#!/usr/bin/env ruby

require 'aeroplane'

class MockATC
  attr_reader :aeroplane, :airport, :operation

  def initialize
    @aeroplane = nil
    @airport = nil
    @operation = nil
  end

  def clear(aeroplane)
    @aeroplane = aeroplane
    self
  end

  def to(operation, options = {})
    @operation = operation
    @airport = options[:at] || :default
  end
end
    

describe Aeroplane do

  before(:each) { stub_const("ATC", MockATC.new) }

  let(:airport) do
    airport = double(:airport)
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

      it "uses airport when passed one" do
        subject = described_class.new(airport)
        expect(subject.airport).to eq airport
      end
      
      it "docked at airport when passed one" do
        expect_any_instance_of(described_class)
          .to receive(:manage_dock).with(airport)
        subject.land(airport)
        subject = described_class.new(airport)
      end
    end
  end

  describe "#flying?" do
    context "knows when flying" do
      it "when flying" do
        expect(subject).to be_flying
      end

      it "when grounded" do
        subject = described_class.new(airport)
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

    context "initiates landing" do
      it "calls manage_landing" do
        expect(subject).to receive(:manage_landing).with(airport)
        subject.land(airport)
      end
    end
  end

  describe "#manage_landing" do
    context "checks if already landed" do
      it "no error if flying" do
        allow(subject).to receive(:flying?).and_return(true) 
        expect { subject.manage_dock(airport) }
          .to_not raise_error(AeroplaneError)
      end

      it "raises error if landed" do
        allow(subject).to receive(:flying?).and_return(false) 
        expect { subject.manage_dock(airport) }.to raise_error(AeroplaneError)
      end
    end

    context "lands at an airport" do
      it "calls do_landing with airport" do
        expect(subject).to receive(:do_landing).with(airport)
        subject.land(airport)
      end
    end
      
    context "interacts with airport" do
      it "gets permission from airport" do
        subject.manage_landing(airport)
        expect(ATC.aeroplane).to be subject
        expect(ATC.airport).to be airport
        expect(ATC.operation).to be :land
      end

      it "registers with airport" do
        expect(airport).to receive(:register_arrival).with(subject)
        subject.land(airport)
      end
    end
  end

  describe "#do_landing" do
    context "actually lands aeroplane" do
      it "sets @airport to passed value" do
        subject.do_landing(airport)
        expect(subject.airport).to eq airport
      end
    end
  end

  describe "#take_off" do
    subject { described_class.new(airport) }

    context "checks if already landed" do
      it "raises error if flying" do
        expect(subject).to receive(:flying?).and_return(true) 
        expect { subject.take_off }.to raise_error(AeroplaneError)
      end

      it "no error if landed" do
        expect(subject).to receive(:flying?).and_return(false) 
        expect { subject.take_off }.to_not raise_error(AeroplaneError)
      end
    end

    context "initiates take off" do
      it "calls manage_take_off" do
        expect(subject).to receive(:manage_take_off).with(airport)
        subject.take_off
      end
    end
  end

  describe "#manage_take_off" do
    subject { described_class.new(airport) }

    context "leaves airport" do
      it "calls do_take_off" do
        expect(subject).to receive(:do_take_off)
        subject.take_off
      end
    end
      
    context "interacts with airport" do
      it "gets permission from airport" do
        subject.manage_take_off(airport)
        expect(ATC.aeroplane).to be subject
        expect(ATC.airport).to be :default
        expect(ATC.operation).to be :take_off
      end

      it "registers with airport" do
        expect(airport).to receive(:register_departure).with(subject)
        subject.take_off
      end
    end
  end

  describe "#do_take_off" do
    context "actually takes off" do
      it "sets @airport to passed value" do
        subject = described_class.new(airport)
        subject.do_take_off
        expect(subject.airport).to eq nil
      end
    end
  end

  describe "#manage_dock" do
    subject { described_class.new(airport) }
    context "arrives at airport" do
      it "calls do_take_off" do
        expect(subject).to receive(:do_landing).with(airport)
        subject.manage_dock(airport)
      end
    end
      
    context "interacts with airport" do
      it "gets permission from airport" do
        subject.manage_dock(airport)
        expect(ATC.aeroplane).to be subject
        expect(ATC.airport).to be airport
        expect(ATC.operation).to be :dock
      end

      it "registers with airport" do
        expect(airport).to receive(:register_arrival).with(subject)
        subject.manage_dock(airport)
      end
    end
  end
end
