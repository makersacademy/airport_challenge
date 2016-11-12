require 'weather'

describe Weather do
  it "should create an object" do
    expect(subject).to be_a(Object)
  end
  it "should contain a radom_weather method" do
    expect(subject).to respond_to(:random_weather)
  end
  # it "should be either stormy or sunny" do
  #   expect(subject).to eq "stormy" || "sunny"
  # end

end
