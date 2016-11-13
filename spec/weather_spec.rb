require "weather"

describe Weather do

  it "should sometimes be stormy" do
    expect(subject.stormy).to eq true
  end

end
