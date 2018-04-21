require 'plane'

describe Plane do

  describe '#flying?' do
    context " when the plane is in an airport " do
        it 'returns false' do
          expect(subject.flying?).to eq false
        end
    end


  end

  describe '#land' do

    it 'lands the plane' do
      subject.land
      expect(subject.flying?).to eq false
    end

  end

  describe '#take_off' do

    context 'when the plane is not flying' do

      it "takes off" do
        subject.take_off
        expect(subject.flying?).to eq true
      end

    end

    context 'when the plane is in the air' do

      it "raises an error" do
        subject.take_off
        expect { subject.take_off }.to raise_error
      end

    end

  end
end
