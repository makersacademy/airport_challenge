require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do

  describe '#land_plane and #takeoff' do
  it 'allows planes to land' do
    expect(subject).to respond_to :land_plane
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  end 
end
