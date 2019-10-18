require "weather"

describe Weather do
  let(:subject) { Weather.new }

  it "is a instance of weather" do
    expect(subject).to be_instance_of(Weather)
  end
end
