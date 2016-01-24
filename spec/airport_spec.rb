require "airport"


describe Airport do
  
  it "creates an instance of the class" do
    expect(described_class.new "Stansted").to be_a Airport
  end
  
  it { is_expected.to respond_to(:planes)}
  
end