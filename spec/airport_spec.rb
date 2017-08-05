require './docs/airport.rb'

describe Airport do
  it "allows planes to take off" do
    expect(subject).to respond_to(:take_off)
  end

end
