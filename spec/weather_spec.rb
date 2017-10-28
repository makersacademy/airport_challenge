require 'weather'

describe Weather do
  subject { Weather.new }

  it "should return an instance of Weather" do
    expect(subject).to be_an_instance_of(Weather)
  end

  it "should respond to #stormy?" do
    expect(subject).to respond_to(:stormy?)
  end
end
