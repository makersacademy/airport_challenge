require 'airport'

describe Plane do
  describe '#landing' do
    it 'lands the plane' do
      subject.landing(Plane.new)
      expect(subject.landing(Plane.new)).to eq @plane
    end
  end

  # describe '#take_off' do
  #   plane = Plane.new
  #   subject.take_off(plan)
  #   it 'takes off the plane' do
  #     expect(subject.take_off(plane)).to eq Plane.new
  #   end
  # end

#   describe '#confirm' do
#     it 'confirms that the plane is no longer at the airport' do
#       expect(subject.confrim(plane)).to eq plane.status?
#     end
#   end

end
