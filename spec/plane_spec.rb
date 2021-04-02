describe Plane do
  
  it { is_expected.to respond_to(:land) }

  context 'landing' do
    it 'allows a plane to land at an airport' do
      # expect { subject.land }.not_to raise_error
      expect(subject.land).to be_truthy
    end
  end
end
