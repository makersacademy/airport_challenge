require 'airport'

describe Airport do

  it "can #park" do
    expect(subject).to respond_to(:park)
  end

end
