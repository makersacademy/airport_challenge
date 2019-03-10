# Feature lab

describe "Features lab:" do
  it '' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

end
