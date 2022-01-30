require_relative '../lib/airport.rb'

describe Airport do
  describe "#land"
  it { is_expected.to respond_to(:land).with(1).argument }

  describe "#take_off"
  it { is_expected.to respond_to(:take_off).with(1).argument }
end