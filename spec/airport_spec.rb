require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new }

  # "I would like to instruct a plane to land"
  it "instructs a plane to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  # "I would like to instruct a plane to land"
  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end
