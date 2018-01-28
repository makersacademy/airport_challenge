require "weather_module"

describe Weather do

  it "Correctly makes it stormy if rand returns a value above 8" do
  allow(stormy?).to receive(:rand).and_return(9)
  expect(stormy?).to be true
end

end
