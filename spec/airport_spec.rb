require 'airport'

describe Airport do
  describe '#landing' do
    it 'lands the plane' do
      subject.landing(Plane.new)
      expect(subject.landing(Plane.new)).to eq @plane
    end
  end

  # describe '#take_off' do
  #   plane = Plane.new
  #   subject.take_off(plane)
  #   it 'takes off the plane' do
  #     expect(subject.take_off(plane)).to eq Plane.new
  #   end
  # end

end
