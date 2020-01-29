require "airport"
require "plane"
require "spec_helper"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe "#land" do
    context "when not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return false
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
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "cannot land plane when stormy"
      end
    end
  end

  describe "#take_off" do
    it "instructs a plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
