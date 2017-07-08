require "atc"

describe "Atc" do

  it "instructs plane to land" do
    subject = Atc.new
    subject.instruct_landing
    expect(subject.instruct_landing).to eq true 
  end

end
