require "airport"
require "plane"
require "spec_helper"
require "weather_report"

describe Airport do
  subject(:airport) { described_class.new(20, weather_report) }
  let(:plane) { double :plane }
  let(:weather_report) { double :weather_report }

  describe "#land" do
    context "when not stormy" do
      before do
        allow(weather_report).to receive(:stormy?).and_return false
      end
      it "instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end
      context "when full" do
        it "raises error" do
          20.times { airport.land(:plane) }
          expect { airport.land(:plane) }.to raise_error "cannot land when airport full"
        end
      end
    end

    context "when stormy" do
      it "raises error if asked to land" do
        allow(weather_report).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "cannot land plane when stormy"
      end
    end
  end

  describe "#take_off" do
    context "when not stormy" do
      it "instructs a plane to take off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end
    context "when stormy" do
      before do
        allow(weather_report).to receive(:stormy?).and_return true
      end
      it "raises an error" do
        expect { airport.take_off(plane) }.to raise_error "cannot take off when stormy"
      end
    end
  end
end
