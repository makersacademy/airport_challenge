require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new }

  it "airport can instruct the plane to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'airport can instruct plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'airport can confirm that the plane is no longer in the airport' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end
