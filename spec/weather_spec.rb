require_relative "../lib/weather"
describe Weather do
  it "Checks for bad weather" do 
    allow(subject).to receive(:num) { 90 }
    expect true
  end

  it "Checks for fine weather" do
    allow(subject).to receive(:num) { 1 }
    expect false
  end
end
