require 'plane'

describe Plane do
  it "responds to flying?" do
    expect(subject).to respond_to :flying?
  end

end
