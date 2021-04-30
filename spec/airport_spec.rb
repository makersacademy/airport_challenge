require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it "Expects a plane to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "Instructs a plane to take_off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end
