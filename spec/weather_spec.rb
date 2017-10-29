#!/usr/bin/env ruby

require 'weather'

describe Weather do

  let(:chance) { Weather::DEFAULT_STORM_CHANCE }

  describe "created with" do
    context "storm chance" do
      it { is_expected.to respond_to :storm_chance }

      it "creates with default storm chance" do
        expect(subject.storm_chance).to eq chance
      end

      it "creates with specified storm chance" do
        subject = described_class.new(storm_chance: 0)
        expect(subject.storm_chance).to eq 0
      end
    end

    describe "#get" do
      context "with high rand value" do
        it "generates clear weather" do
          Object.any_instance.stub(:rand).and_return(1)
          expect(subject.get).to eq :clear
        end
      end

      context "with low rand value" do
        it "generates clear weather" do
          Object.any_instance.stub(:rand).and_return(0)
          expect(subject.get).to eq :stormy
        end
      end
    end
  end
end
