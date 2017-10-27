#!/usr/bin/env ruby

require 'weather'
require 'airport'

describe Airport do

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
      it { is_expected.to respond_to :weather }

      it "creates by default" do
        expect(subject.weather).to be_a Weather
      end

      it "creates with user value" do
        subject = described_class.new(nil, "hello")
        expect(subject.weather).to eq "hello"
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
end
