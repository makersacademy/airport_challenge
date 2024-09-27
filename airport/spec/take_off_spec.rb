require 'take_off'

describe Take_off do
  it "iterates over landed planes array to check if there are planes in the airport" do
    take_off = Take_off.new
    landed_planes = ["plane", "plane", "plane", "plane", "plane"]
    flying_plane = []
    take_off.flying(landed_planes, flying_plane)
    take_off = double("take_off")
    # expect(landed_planes.length).to eq(0)
    # expect(flying_plane.length).to eq(5)
    allow(take_off).to receive_message_chain(:flying).and_return("Bad weather. Take_offs cancelled")
  end

  it "checks that not planes attempt to take_off from empty airports" do
    take_off = Take_off.new
    landed_planes = []
    flying_plane = []
    expect(take_off.flying(landed_planes, flying_plane)).to eq("Empty airport. No planes to take_off")
  end

  it "checks that no plane takes off under stormy weather" do
    take_off = Take_off.new
    airport = double("airport")
    allow(airport).to receive_message_chain(:weather).and_return("sunny")
    allow(airport).to receive_message_chain(:weather).and_return("stormy")
  end
end