require "airplane"

describe Airplane do 
  it "show airlane is flying" do
    expect(subject.flying).to eq true
  end

  it "checks airplane status" do
    expect(subject.flying?).to eq true
  end
end
