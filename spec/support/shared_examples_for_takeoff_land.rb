shared_examples_for BikeContainer do

  describe '#land' do
    let(:weather){double(:weather)}

    it 'they all land planes' do
      expect(subject.land ( self.class.plane ? airport : plane, weather)


  end

end

end
