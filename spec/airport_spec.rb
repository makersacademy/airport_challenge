require "airport"
require "plane"


describe Airport do

  it { is_expected.to respond_to(:land) }

  describe "#land" do
    it 'allows airplanes to land' do
      dxb = Airport.new
      pj = Plane.new
      dxb.land(pj)
      expect(dxb.hangar).to include(pj)
    end
  end

end  
=begin  
  describe "#hangar" do
    it 'allows airplanes to land' do
      dxb = Airport.new
      pj = Plane.new
      expect(dxb.hangar).to include(pj)
    end 
  end
=end




=begin
  describe "#initialize" do
    it 'allows user to set initial station capacity' do
      station =
=end