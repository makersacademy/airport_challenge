require 'weather'

describe Weather do

  it "is an instance of the Weather class" do
    expect(subject.is_a?(Weather)).to eq true
  end

  it "stormy? should return true if it is stormy" do
    expect(subject.stormy?).to eq false
  end

end
