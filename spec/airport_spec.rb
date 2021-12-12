require 'airport'
require 'plane'

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
  
  describe "Max Cap error" do
    it "prevents landing when max capacity" do
      10.times { subject.land Plane.new }
      expect{ subject.land Plane.new }.to raise_error 'At maximum capacity'
    end
  end
end