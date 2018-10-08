require 'weather'

describe Weather do

  it "returns that the weather is sunny" do
    expect(subject.check).to eq "sunny"
  end

  it "returns that the weather is stormy" do
    expect(subject.check).to eq "stormy"
  end

end
