require 'weather'

describe Weather do

  it "can give a weather forecast" do
    expect(subject).to respond_to(:forecast)
  end

end