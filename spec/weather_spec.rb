require 'weather'

describe Weather do
  it "is fine. Unit test" do
    srand 3
    expect(subject.forecast).to eq "fine"
  end
  it "is stormy. Unit test" do
    srand 5
    expect(subject.forecast).to eq "stormy"
  end
end
