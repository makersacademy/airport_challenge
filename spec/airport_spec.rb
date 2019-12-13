require 'airport.rb'

describe Airport do
  it 'expects a class which creates instances' do
    expect(Airport.new).to be_a(Airport)
  end

  it 'can respond to message land_plane' do
    expect(Airport.new).to respond_to(:land_plane)
  end

  it 'can respond to message take_off' do
    expect(Airport.new).to respond_to(:take_off)
  end

  it 'can show user if plane has taken off' do
    expect(Airport.new).to respond_to(:hangar)
  end
end
