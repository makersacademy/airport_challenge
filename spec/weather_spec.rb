require 'weather'

describe Weather do
  it "is stormy" do
    expect( subject.stormy ).to eq true
  end

  it "is not sotrmy" do
    expect( subject.not_stormy ).to eq false
  end

end
