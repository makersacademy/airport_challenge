require 'weather'

describe Weather do

  it "puts out a weather forecast" do
    expect(subject).to respond_to(:todays_forecast)
  end

  it "returns an element from the array" do
    expect(subject.todays_forecast).to be_a(String)
  end
end
