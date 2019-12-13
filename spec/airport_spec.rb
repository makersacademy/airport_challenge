require './lib/airport'

describe Airport do

  it 'can creates an airport' do
    expect(Airport.new).to be_a Airport
  end

  it 'can land a plane' do
    expect(Airport.new).to respond_to(:land).with(1).argument
  end

  it 'can take off a plane' do
    expect(Airport.new).to respond_to(:take_off).with(1).argument
  end

end
