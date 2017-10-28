#!/usr/bin/env ruby

require 'atc'

class MockOperation
  attr_reader :airport
  def initialize(airport)
    @airport = airport
  end
end

describe ATC do

  subject { described_class }
  let(:airport) { double(:airport) }
  before(:each) { stub_const("Operation", MockOperation) }

  describe "#clear" do
    context "creates operation for actioning" do
      it "returns mocked Operation" do
        expect(subject.clear(airport)).to be_a MockOperation
      end

      it "returns operation containing passed argument" do
        expect(subject.clear(airport).airport).to eq airport
      end
    end
  end
end
