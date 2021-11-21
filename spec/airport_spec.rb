require 'airport'

describe Airport do
  subject(:airport) { described_class.new(30) }

  it 'instructs a plane to land' do
  expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off and confirm that it is no longer in the airport' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'will not allow to landing, when no speces' do
    plane = double :plane
    30.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Unable to land plane: no empty spaces.'
  end
end