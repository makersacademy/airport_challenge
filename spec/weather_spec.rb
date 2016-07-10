require "weather"

describe Weather do
  it "has a method that checks if stormy"do
    expect(subject).to respond_to(:stormy?)
  end
  it "has a chance to be stormy" do
    #stormy when < 3
    allow(subject).to receive(:prob).and_return(1)
    expect(subject.stormy?).to eq true
  end
end
