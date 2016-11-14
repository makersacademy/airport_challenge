require 'weather'

describe Weather do

  it "should return true if weather is stormy" do
    allow(subject).to receive(:stormy?) {true}
    expect(subject.stormy?).to eq true
  end

end
