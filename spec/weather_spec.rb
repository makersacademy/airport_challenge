require './docs/weather.rb'

describe Weather do
  it "Creates a new instance of weather." do
    expect(subject).to be_instance_of Weather
  end

	 it "Returns calm or stormy weather randomly" do
   	expect(subject.status).to eq("Clear").or eq("Stormy")
  end
end
