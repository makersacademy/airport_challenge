require "weather"

describe Weather do

  specify { expect(subject.operable?).to eq true }

  it "stormy weather defind operable as false" do
    subject.stormy
    expect(subject.operable?).to eq false
  end

end