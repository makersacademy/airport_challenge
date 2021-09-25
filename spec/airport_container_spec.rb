require "plane"

RSpec.describe AirportContainer do
  it "shows airport capacity" do
    view_capacity = @capacity
    expect(subject.view_capacity).to eq(@capacity)
  end

end
