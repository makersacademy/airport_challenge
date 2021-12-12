require "airplane"

describe Airplane do 
  it "show airlane is not flying" do
    subject.fly
    expect(subject.flying?).to eq true
  end
end