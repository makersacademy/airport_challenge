require 'weather'

describe Weather do

  it "puts out a weather forecast" do
    expect(subject).to respond_to(:todays_forecast)
  end
end
