#!/usr/bin/env ruby

require 'weather'
require 'air_exceptions'
require 'airport'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

class MockATC
  attr_reader :airport, :operation

  def initialize
    @airport = nil
    @operation = nil
  end

  def clear(airport)
    @airport = airport
    self
  end

  def to(operation)
    @operation = operation
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

  describe "#weather" do
    context "generates weather" do
      it "gets weather from generator" do
        subject = described_class.new(weather: weather)
        expect(weather).to receive(:get).and_return(:stormy)
        subject.weather
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

  describe "#register_arrival" do
    context "receives incoming aircraft" do
      it "pushes aircraft to hangar" do
        subject.register_arrival(:aircraft)
        expect(subject.hangar).to include(:aircraft)
      end
    end
  end

  describe "#register_departure" do
    context "removes outbound aircraft" do
      it "removes aircraft from hangar" do
        subject.hangar.push(:aircraft)
        subject.register_departure(:aircraft)
        expect(subject.hangar).to_not include(:aircraft)
      end
    end
  end

  describe "#process_landing" do
    context "makes checks" do
      it "passes self to ATC" do
        subject.process_landing(aeroplane)
        expect(ATC.airport).to eq subject
        expect(ATC.operation).to eq :land
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
        subject.process_docking(aeroplane)
        expect(ATC.airport).to eq subject
        expect(ATC.operation).to eq :dock
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
        subject.process_take_off(aeroplane)
        expect(ATC.airport).to eq subject
        expect(ATC.operation).to eq :take_off
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
        expect(subject.to_s).to start_with "Airport 'hello'"
      end
    end

    context "with no name" do
      it "starts with class" do
        expect(subject.to_s).to start_with "Airport ("
      end
    end

    context "ends with capacity" do
      it "counts occupancy and limit" do
        subject = described_class.new(capacity: 10)
        expect(subject.to_s).to end_with "(0/10 aircraft)"
      end
    end
  end
end
