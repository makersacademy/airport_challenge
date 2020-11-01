require 'airport'
require 'plane'
require 'weather'

describe "Integrations" do
  it "appropriately takes off and lands number of planes using actual classes" do
    alpha = Plane.new
    bravo = Plane.new
    charlie = Plane.new
    delta = Plane.new
    airport1 = Airport.new(50, [alpha, bravo, charlie, delta])
    airport2 = Airport.new

    allow(airport1).to receive(:current_weather).and_return('chill')
    alpha.take_off(airport1)
    allow(airport2).to receive(:current_weather).and_return('chill')
    alpha.land(airport2)
    expect(airport2.planes).to include(alpha)

    allow(airport1).to receive(:current_weather).and_return('chill')
    bravo.take_off(airport1)
    allow(airport2).to receive(:current_weather).and_return('chill')
    bravo.land(airport2)
    expect(airport2.planes).to include(bravo)
    expect { bravo.land(airport2) }.to raise_error("Plane is already on the ground!")

    allow(airport2).to receive(:current_weather).and_return('chill')
    bravo.take_off(airport2)
    allow(airport1).to receive(:current_weather).and_return('chill')
    bravo.land(airport1)
    expect(airport1.planes).to include(bravo)
    expect(airport1.planes).to include(charlie)
    expect(airport1.planes).to include(delta)
  end
end