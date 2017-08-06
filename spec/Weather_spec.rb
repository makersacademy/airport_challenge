require "airport"
require "plane"
require "weather"

describe Weather do

  it {expect(subject).to respond_to :stormy?}

  it "stormy should equal true or false" do
     expect(subject.stormy?).to eq(true).or eq(false)
  end

end
