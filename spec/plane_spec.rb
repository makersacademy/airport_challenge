require 'plane'

describe Plane do
  let(:test_plane) { Plane.new }
  let(:test_airport) { Airport.new }

  it "a new plane defaults to flying status: True and location: The Sky!" do
    expect(test_plane.status).to eq({ flying: true, location: "The Sky!"})
  end

  it "after landing at an airport it adjusts status to flying: False and location: Airport " do
    test_plane.land(test_airport)
    expect(test_plane.status).to eq({ flying: false, location: test_airport.name })
  end
end
