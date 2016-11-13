require "airport"
require "weather"

describe Airport do

  it "should prevent planes from landing there when it is at full capacity" do
    expect(subject.prevent_landing(21)).to eq true
  end

  it "should allow planes to land when it is not at full capacity" do
    expect(subject.prevent_landing(19)).to eq false
  end


end
