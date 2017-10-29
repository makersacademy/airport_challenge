#!/usr/bin/env ruby

require 'atc'

class MockOperation
  attr_reader :airport
  def initialize(airport)
    @airport = airport
  end
end

class MockAirport
end

describe ATC do

  subject { described_class }
  let(:airport) { MockAirport.new }
  before(:each) { stub_const("Operation", MockOperation) }
  before(:each) { stub_const("Airport", MockAirport) }

  describe "#clear" do
    context "doesn't accept non-aeroplanes" do
      it "raises error for non-aeroplanes" do
        expect { subject.clear(nil) }.to raise_error ArgumentError
      end

      it "raises no error for aeroplanes" do
        expect { subject.clear(airport) }.to_not raise_error
      end
    end

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
