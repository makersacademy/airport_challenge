describe Plane do
  describe '#initialize' do
    it 'initialize accepts 1 arguement' do
      expect(subject).to respond_to(:initialize).with(1).arguement
    end
  end
  it 'responds to location with sky' do
    expect(subject.location).to eq 'sky'
  end
end
