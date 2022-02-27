require 'airport'

describe Airport do
  it "should respond to land with 1 argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end
end
