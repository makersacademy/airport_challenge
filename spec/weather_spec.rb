require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it "should return true " do
    allow(Kernel).to receive(:rand).and_return(40)
    expect(weather.stormy?).to eq true
  end

  it "should return false " do
    allow(Kernel).to receive(:rand).and_return(20)
    expect(weather.stormy?).to eq false
  end

end
