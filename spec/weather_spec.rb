require 'weather'

describe Weather do

  it "should respond to the weather conditions" do
    expect(subject).to respond_to :weather_conditions
  end

end
