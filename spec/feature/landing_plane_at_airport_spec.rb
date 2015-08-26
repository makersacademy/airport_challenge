feature 'land plane at airport' do
  scenario 'single plane' do
    plane = Plane.new
    airport = Airport.new
    airport.land plane

    # $ irb
    # 2.1.5 :001 > plane = Plane.new
    #  => #<Plane:0x007fb4e6404410>
    # 2.1.5 :002 > airport = Airport.new
    #  => #<Airport:0x007fb4e640cb60>
    # 2.1.5 :003 > airport.land plane
    #  => #<Plane:0x007fb4e6404410>
  end
end
