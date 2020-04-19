require 'airport'

describe Airport do

  it "Instructs a plane to land at the Airport." do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "Instructs a plane to take_off." do
    expect(subject).to respond_to(:take_off)
  end

end
