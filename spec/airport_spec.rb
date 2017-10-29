#!/usr/bin/env ruby

require 'airport'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

class MockATC
  def clear_docking(airport)
  end

  def clear_landing(airport)
  end

  def clear_take_off(airport)
  end
end

class MockWeather
end

describe Airport do

  let(:weather) { MockWeather.new }
  let(:aeroplane) { double(:aeroplane) }
  before(:each) { stub_const("ATC", MockATC.new) }
  before(:each) { stub_const("Weather", MockWeather) }

  describe "creates with" do
    context "name" do
      it { is_expected.to respond_to :name }

      it "has default name" do
        expect(subject.name).to be_nil
      end

      it "has name if passed one" do
        subject = described_class.new(name: "hello")
        expect(subject.name).to eq "hello"
      end
    end

    context "hangar" do
      it { is_expected.to respond_to :hangar }

      it "is an Array" do
        expect(subject.hangar).to be_a Array
      end

      it "is empty" do
        expect(subject.hangar).to be_empty
      end
    end

    context "weather generator" do
      it { is_expected.to respond_to :weather_generator }

      it "creates by default" do
        expect(subject.weather_generator).to be_a MockWeather
      end

      it "creates with user value" do
        subject = described_class.new(weather: "wg")
        expect(subject.weather_generator).to eq "wg"
      end
    end

    context "capacity" do
      it { is_expected.to respond_to :capacity }

      it "creates by default" do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it "creates with user value" do
        subject = described_class.new(capacity: 30)
        expect(subject.capacity).to eq 30
      end
    end
  end

  describe "#occupancy" do
    context "knows number of aircraft" do
      it "with 10 aircraft" do
        10.times { subject.hangar.push(nil) }
        expect(subject.occupancy).to eq 10
      end

      it "with 20 aircraft" do
        20.times { subject.hangar.push(nil) }
        expect(subject.occupancy).to eq 20
      end
    end
  end

  describe "#full?" do
    context "knows if at capacity" do
      it "when not at capacity" do
        expect(subject).to_not be_full
      end

      it "when at capacity" do
        subject = described_class.new(capacity: 20)
        20.times { subject.hangar.push(nil) }
        expect(subject).to be_full
      end
    end
  end

  describe "#stormy?" do
    context "knows when weather is stormy" do

      subject { described_class.new(weather: weather) }

      it "is true when weather is stormy" do
        allow(weather).to receive(:get).and_return(:stormy)
        expect(subject).to be_stormy
      end

      it "is false when weather is clear" do
        allow(weather).to receive(:get).and_return(:clear)
        expect(subject).to_not be_stormy
      end
    end
  end

  describe "include?" do
    context "knows if aircraft" do
      it "is present" do
        subject.hangar.push(:aircraft)
        expect(subject).to include(:aircraft)
      end

      it "is not present" do
        expect(subject.hangar).to_not include(:aircraft)
      end
    end
  end

  describe "#process_landing" do
    context "makes checks" do
      it "passes self to ATC" do
        expect(ATC).to receive(:clear_landing).with(subject)
        subject.process_landing(aeroplane)
      end
    end

    context "moves aircraft to hangar" do
      it "calls #register_arrival" do
        expect(subject).to receive(:register_arrival).with(aeroplane)
        subject.process_landing(aeroplane)
      end
    end
  end

  describe "#process_docking" do
    context "makes checks" do
      it "passes self to ATC" do
        expect(ATC).to receive(:clear_docking).with(subject)
        subject.process_docking(aeroplane)
      end
    end

    context "moves aircraft to hangar" do
      it "calls #register_arrival" do
        expect(subject).to receive(:register_arrival).with(aeroplane)
        subject.process_docking(aeroplane)
      end
    end
  end

  describe "#process_take_off" do
    context "makes checks" do
      it "passes self to ATC" do
        expect(ATC).to receive(:clear_take_off).with(subject)
        subject.process_take_off(aeroplane)
      end
    end

    context "moves aircraft to hangar" do
      it "calls #register_arrival" do
        expect(subject).to receive(:register_departure).with(aeroplane)
        subject.process_take_off(aeroplane)
      end
    end
  end

  describe "#to_s" do
    context "with name" do
      it "starts with class and name" do
        subject = described_class.new(name: "hello")
        expect(subject.to_s).to start_with "Airport (hello)"
      end
    end

    context "with no name" do
      it "starts with class" do
        expect(subject.to_s).to start_with "Airport (unnamed)"
      end
    end
  end
end
