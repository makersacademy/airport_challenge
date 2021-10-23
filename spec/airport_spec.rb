require './lib/airport'
require './lib/plane'

describe Airport do
  subject(:airport) {described_class.new}

  it "instructs a plane to land" do
    expect(airport).to  respond_to(:land).with(1).argument
  end

  it "instructs a plane to take off" do
    expect(airport.take_off).to eq "Taken Off"
  end

end