require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport
  # and confirm that it is no longer in the airport

  it "instructs a plane to take off" do
    expect(airport).to respond_to(:take_off)
  end
end
