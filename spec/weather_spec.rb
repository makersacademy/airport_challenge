require 'weather'

describe Weather do

  it "Can be stormy" do
    expect(subject).to respond_to(:stormy?)
  end

  it "Should be stormy when random number is 2" do
    allow(subject).to receive(:weather) { 2 }
    expect(subject.stormy?).to eq(true)
  end

end
