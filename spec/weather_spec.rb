require 'weather'

describe Weather do
  it "responds to the method make_weather" do
    expect(subject).to respond_to(:make_weather)
  end
  it "responds to the mether random_num" do
    expect(subject).to respond_to(:random_num)
  end
end
