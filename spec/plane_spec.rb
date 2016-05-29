describe Plane do

  context 'Responds to' do

    it '#is_landed' do
      expect(subject).to respond_to :is_landed
    end

    it '#not_landed' do
      expect(subject).to respond_to :not_landed
    end

    it '#landed?' do
      expect(subject).to respond_to :landed?
    end
  end

end
