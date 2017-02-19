require 'weather'

describe Weather do
  #it {is_expected.to respond_to(:weather)}

  it "puts out a weather forecast" do
    expect(subject).to respond_to(:todays_forecast)
  end
end

# Couldn't the program just run from the weather.rb and if the
# weather is sunny, run take off. Or if its stormy, don't take
# off but return 'its too dangerous'.
