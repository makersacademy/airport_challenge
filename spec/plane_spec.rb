require 'plane'
describe Plane do

  describe '#landed' do
    it "tells the plane is at the aiport" do
      subject.landed?
      expect(subject.landed?).to be true
    end
  end
  describe '#take_off' do
    it "tells the plane has taken off" do
      allow(subject).to receive(:landed?).and_return(false)
      expect(subject.landed?).to be false    
    end
  end


end
