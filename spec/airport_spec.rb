require 'airport'

describe Airport do

  it "Instructs a plane to land at the Airport." do
    expect(subject).to respond_to(:land).with(1).argument
  end

end
