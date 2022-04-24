describe Weather do 
  describe "#stormy?" do
    it 'should check the state of the weather' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end
end