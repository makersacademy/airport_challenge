require_relative '../lib/airport'

describe Airport do

  subject { described_class.new }

  it "Lets plane land in airport" do
    airport = Airport.new
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "Confirms plane has left airport" do
    airport = Airport.new
    expect(subject).to respond_to(:plane_left_airport?)
  end

end
