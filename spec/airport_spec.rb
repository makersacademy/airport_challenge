#!/usr/bin/env ruby

require 'weather'
require 'air_exceptions'
require 'airport'

describe Airport do

  let(:weather) { weather = double(:Weather) }

  describe "created with" do
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
        expect(subject.weather_generator).to be_a Weather
      end

      it "creates with user value" do
        subject = described_class.new(nil, "hello")
        expect(subject.weather_generator).to eq "hello"
      end
    end

    context "capacity" do
      it { is_expected.to respond_to :capacity }

      it "creates by default" do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it "creates with user value" do
        subject = described_class.new(30, nil)
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
        subject = described_class.new(20, nil)
        20.times { subject.hangar.push(nil) }
        expect(subject).to be_full
      end
    end
  end

  describe "#capacity_check" do
    context "depending on capacity" do
      it "raises error (if full)" do
        subject = described_class.new(20, nil)
        20.times { subject.hangar.push(nil) }
        expect { subject.capacity_check }.to raise_error AirportError
      end

      it "does nothing (if not full)" do
        subject = described_class.new(20, nil)
        19.times { subject.hangar.push(nil) }
        expect { subject.capacity_check }.to_not raise_error AirportError
      end
    end
  end

  describe "#weather" do
    context "generates weather" do
      it "gets weather from generator" do
        subject = described_class.new(nil, weather)
        expect(weather).to receive(:get).and_return(:stormy)
        subject.weather
      end
    end
  end

  describe "#stormy?" do
    context "knows when weather is stormy" do
      it "is true when weather is stormy" do
        subject = described_class.new(nil, weather)
        allow(weather).to receive(:get).and_return(:stormy)
        expect(subject).to be_stormy
      end

      it "is false when weather is clear" do
        subject = described_class.new(nil, weather)
        allow(weather).to receive(:get).and_return(:clear)
        expect(subject).to_not be_stormy
      end
    end
  end

  describe "#weather_check" do
    context "depending on weather" do
      it "raises error (if stormy)" do
        described_class.any_instance.stub(:weather).and_return(:stormy)
        expect { subject.weather_check }.to raise_error AirportError
      end

      it "does nothing (if not stormy)" do
        described_class.any_instance.stub(:weather).and_return(:clear)
        expect { subject.weather_check }.to_not raise_error AirportError
      end
    end
  end
end
