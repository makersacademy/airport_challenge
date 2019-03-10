require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new }

  # "I would like to instruct a plane to land"
  it { is_expected.to respond_to(:land).with(1).argument }
  it "instructs a plane to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end
end
