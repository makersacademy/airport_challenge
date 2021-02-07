require 'airport'
require 'plane'

describe Airport do

  it "it is at or past capacity" do
    expect(subject.full?).to eq(true)
  end
  # 
  # it "lands" do
  #   expect(@planes += 1).to eq(true)
  # end

end
