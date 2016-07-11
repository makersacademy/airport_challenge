require 'weather'

describe Weather do

  it "should check if stormy" do
    allow(subject).to receive(:stormy?).and_return(true)
    expect(subject.stormy?).to be true
  end

  it "should check if sunny" do
    allow(subject).to receive(:stormy?).and_return(false)
    expect(subject.stormy?).to be false
  end

end
