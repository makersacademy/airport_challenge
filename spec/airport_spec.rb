require "./lib/airport.rb"

describe Airport do

  it "prevent landing when airport full" do
    expect(plane.take_off).to eq(nil)
  end
end