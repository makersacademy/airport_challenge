require 'weather'
describe Weather do
  
  it "should generate a random weather mostly sunny tho (will fail rspec test if it lands on stormy weather 1 in 10)" do
    expect(subject.stormy?).to eq false
  end
  
end
