require "airport"

describe Airport do

  it "should know if it is at full capacity" do
    expect(subject.full_capacity?).to eq true
  end

  it "should be able to prevent planes landing there" do
    expect(subject.prevent_landing).to eq true
  end

  it "should prevent planes from landing there when it is at full capacity" do
    (subject.prevent_landing).should eq(subject.full_capacity?)
  end

end
