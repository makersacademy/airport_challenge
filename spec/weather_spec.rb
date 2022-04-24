describe Weather do 
  describe "#stormy?" do
    it 'should check if it is stormy' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end
end
