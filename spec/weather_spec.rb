require 'weather'

describe Weather do
  it "is fine" do
    srand 500
    expect(subject.status).to eq "fine"
  end
  it "is stormy" do
    srand 300
    expect(subject.status).to eq "stormy"
  end
end
