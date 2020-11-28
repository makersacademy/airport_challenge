require 'weather'

describe Weather do
  it "says whether it is sunny or stormy" do
    expect(subject.generate).to eq(:sunny).or eq(:stormy) 
  end
end
