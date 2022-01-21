require 'weather'

describe Weather do
  it "to be boolean" do 
    expect(subject.stormy?).to eq(true).or eq(false)
  end
end
