require 'airport'

describe Airport do

  it "can instruct planes to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can instruct planes to take off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
