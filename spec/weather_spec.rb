require 'weather'

describe Weather do
  it "has an initialize method" do
    expect(Weather.new).to be_an_instance_of(Weather)
  end
end
