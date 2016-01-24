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
    
end