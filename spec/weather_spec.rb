require_relative "../lib/weather"
describe Weather do
  it "Check for bad weather" do 
    allow(subject).to receive(:num) { 90 }
    expect true
  end
  it "Check for fine weather" do
    allow(subject).to receive(:num) { 1 }
    expect false
  end
end
