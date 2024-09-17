require 'weather'

describe Weather do

  it "can respond to forecast" do
    expect(subject).to respond_to(:forecast)
  end

  it "provides stormy weather" do
    allow(subject).to receive(:forecast) { "stormy" }
    expect(subject.forecast).to eq "stormy"
  end

end
