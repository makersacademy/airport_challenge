require "controller" # controller requires all the required files in one place

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
describe Airport do

  it "has a default capacity of at least one plane" do
    airport = described_class.new # no argument provided
    expect(airport.capacity).to be > 1
  end

  it "allows an overriding capacity to be specified upon instantiation" do
    airport = described_class.new(100)
    expect(airport.capacity).to eq 100
  end

end # end of describe Airport
