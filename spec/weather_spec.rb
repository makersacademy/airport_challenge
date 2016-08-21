require 'weather'

describe Weather do

  it "is stormy" do
    airport = class_double("airport", :conditions => "stormy")
    expect(airport.conditions).to eq "stormy"
  end

end
