require "airport"

describe Airport do

  it "confirm plane has landed" do
    expect(subject.landed?).to eq true
  end

end
