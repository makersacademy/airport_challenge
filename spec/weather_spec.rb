require 'weather'

describe Weather do

  it "responds to weather_report" do
    expect(subject).to respond_to :weather_report
  end

end
