require 'airport'

describe Airport do
  airport = Airport.new(20)
  it 'instructs plane to land' do
	   expect(airport).to respond_to(:land).with(1).argument
  end
  it "instructs plane to take_off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  it "cannot land plane when aiport at capacity" do
    20.times do
      airport.land(:plane)
    end
    expect { airport.land(:plane) }.to raise_error "cannot land plane because airport is full"
  end
end
