require 'airport'

describe Airport do
  describe "Land a plane at the Airport" do
    airport = Airport.new
    it { is_expected.to respond_to :land }
  end

  describe "Take off from the Airport and confirm has left" do
      airport = Airport.new
      it { is_expected.to respond_to :take_off }     
  end 

  it "confirms plane has taken off" do
    airport = Airport.new
    expect(airport.take_off).to eq true
  end 

end