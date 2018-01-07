require_relative "../lib/weather.rb"

describe Weather do 
  it "should return stormy or good"  do
  	expect(subject.forecast).to eq("good"||"stormy") 
  end
end
