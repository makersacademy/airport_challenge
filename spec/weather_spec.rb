require 'weather'

describe Weather do

  it "should be sunny or stormy" do
    expect(subject.stormy?).to eq(true).or eq(false)
  end

end
