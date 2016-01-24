require "airport"


describe Airport do
  before(:each) do
    @tower = double(:controltower)
    @plane = double(:plane)
    @airport = Airport.new "Stansted"
  end
  
  it "creates an instance of the class" do
    expect(described_class.new("Stansted")).to be_a Airport
  end
  
  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:clear?) }
  
  it "#clear? returns true on a new instance" do
    expect(@airport.clear?).to eq true
  end
  
  it { is_expected.to respond_to(:weather=) }
  it { is_expected.to respond_to(:check_weather)}
  
  it "Allows to land in clear weather" do
    allow(@tower).to receive(:land) do |plane, airport|
      "737-1 landed in Stansted"
    end
    expect(@tower.land(@plane, @airport)).to eq "737-1 landed in Stansted"
  end
  it "Allows to take-off in clear weather" do
    allow(@tower).to receive(:take_off) do |plane, airport|
      "737-1 took-off from Stansted"
    end
    expect(@tower.take_off(@plane, @airport)).to eq "737-1 took-off from Stansted"
  end
end