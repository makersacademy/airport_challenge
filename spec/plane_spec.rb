require 'plane'

  describe Plane do

  #responsible for flying up and down

  subject(:plane) { described_class.new }

    describe '#flying' do
      it 'describes the status of the plane' do
      expect(subject).to be_flying
      end
    end

    describe '#descend' do
      it 'brings the plane down' do
        subject.descend
        expect(subject).not_to be_flying
      end
    end

    describe '#ascend' do
      it 'sends the plane up' do
        subject.descend
        subject.ascend
        expect(subject).to be_flying
      end
    end



end
