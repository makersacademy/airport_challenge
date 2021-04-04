require'plane.rb'

describe Plane do 
  it "Responds to landed status" do 
    expect(subject).to respond_to(:landed)
  end
  it "Responds to flying status" do
    expect(subject).to respond_to(:flying)
  end
  it "Checks default value of 'landed' is false" do 
    expect(subject.landed).to eq(false)
  end
  it "Checks default value of 'flying' is false" do 
    expect(subject.flying).to eq(false)
  end
end