require "airport"


describe Airport do
  
  subject(:airport) { described_class.new(name, capacity) }
  
    let(:name) { "Stansted" }  
    let(:capacity) { 3 }
    
  
  it "#clear? returns true on a new instance" do
    expect(airport.clear?).to eq true
  end

    
  it "has a default capacity" do
    expect(airport.capacity).to eq 3
  end
  
  context "Can be created with a different capacity" do
  
  let(:capacity) { 5 }
  it "has variable capacity" do
    expect(airport.capacity).to eq 5
  end
 end
end