describe Plane do
  describe 'status' do
    it 'plane status is flying if not on the ground' do
      expect(subject.status).to eq 'flying'
    end
  end
end
