require 'weather'

describe Weather do

  it "should return an instance of Weather" do
    expect(Weather.new).to be_an_instance_of(Weather)
  end
end
