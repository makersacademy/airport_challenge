require 'plane'

describe Plane do

  it "changes the state to 'grounded' when the 'is_grounded' method is called" do
    subject.is_grounded
    expect(subject.state).to eq "grounded"
  end

  it "changes the state to 'flying' when the 'is_flying' method is called" do
    subject.is_flying
    expect(subject.state).to eq "flying"
  end

end
