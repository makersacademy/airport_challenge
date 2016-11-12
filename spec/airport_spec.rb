require "airport"

describe Airport do

  it "should know if it is at full capacity" do
    expect(subject.full_capacity?).to eq true
  end

end
