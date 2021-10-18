require 'plane'

describe Plane do

  it 'is at the airport?' do

    my_plane = Plane.new

    expect(my_plane.at_airport?).to eq true

  end 
end
