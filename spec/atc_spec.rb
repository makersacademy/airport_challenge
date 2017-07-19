require "atc"

describe Atc do

  it "instructs plane to land" do
    subject = Atc.new
    subject.instruct_landing
    expect(subject.instruct_landing).to eq true
  end

  it "instructs plane to take-off" do
    subject = Atc.new
    subject.instruct_take_off
    expect(subject.instruct_take_off).to eq true
  end

end
