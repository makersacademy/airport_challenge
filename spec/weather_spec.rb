require 'weather'

describe Stormy_Weather do

  it '#report - returns true if #generate_weather is lower than or matches STORM_PROBABILITY' do
    subject.instance_variable_set("@random_weather", 2)
    expect(subject.report).to eq(true)
  end

end
