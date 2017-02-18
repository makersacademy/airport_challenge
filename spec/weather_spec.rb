require 'weather'

describe Weather do
  # it 'has a weather_type method' do
  #   expect(subject).to respond_to(:weather_type)
  # end
  let(:plane) {double(:plane)}

  it "has a safe? method" do
    expect(subject).to respond_to(:safe)
  end
end

# Couldn't the program just run from the weather.rb and if the
# weather is sunny, run take off. Or if its stormy, don't take
# off but return 'its too dangerous'.
