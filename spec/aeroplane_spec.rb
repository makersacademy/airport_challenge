require "aeroplane"

describe Aeroplane do

  it "responds to taken_off?" do
    expect(subject).to respond_to :taken_off?
  end

end
