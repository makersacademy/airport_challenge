require 'weather'

describe Weather do

  it "stormy? should return true if it is stormy" do
    expect(subject.stormy?).to eq(false)
  end

end
