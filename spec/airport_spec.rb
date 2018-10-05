require "airport"

describe Airport do
  describe 'plane_land' do
    it 'responds to plane land' do
      expect(subject).to respond_to :plane_land
    end
  end

  describe 'plane_takeoff' do
    it 'responds to plane takeoff' do
      expect(subject).to respond_to :plane_takeoff
    end
  end
end
