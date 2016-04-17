require 'weather'
require 'rspec/expectations'

describe Weather do
	it {is_expected.to respond_to(:stormy)}
  end
	it "returns true when stormy" do
	  weather1 = Weather.new
	  allow(weather1).to receive(:stormy) {true}
	  end

  it {is_expected.to respond_to(:sunny)}
  it "returns true when sunny" do
    weather2 = Weather.new
    allow(weather).to receive(:sunny) {true}
    end
  end
end