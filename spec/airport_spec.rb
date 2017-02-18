require 'airport'

describe Airport do

  it "instructs a plane to land" do
    expect(subject.instruct_to_land).to eq true
  end

  it "confirms when plane has landed" do
    expect(subject.landed?).to eq true
  end
end
