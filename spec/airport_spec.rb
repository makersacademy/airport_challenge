require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new(20) }

  # "I would like to instruct a plane to land"
  it "instructs a plane to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  # "I would like to instruct a plane to land"
  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end


  it 'does not allow landing when at capacity' do
    plane = double :plane
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
  end
end
