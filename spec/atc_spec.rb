#!/usr/bin/env ruby

require 'atc'

class MockOperation
  attr_reader :aeroplane
  def initialize(aeroplane)
    @aeroplane = aeroplane
  end
end

describe ATC do

  subject { described_class }
  let(:aeroplane) { double(:aeroplane) }
  before(:each) { stub_const("Operation", MockOperation) }

  describe "#clear" do
    context "creates operation for actioning" do
      it "returns mocked Operation" do
        expect(subject.clear(aeroplane)).to be_a MockOperation
      end

      it "returns operation containing passed argument" do
        expect(subject.clear(aeroplane).aeroplane).to eq aeroplane
      end
    end
  end
end
