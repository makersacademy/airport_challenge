require 'plane'

describe Plane do
  subject(:aircraft){described_class.new}

  describe 'initialize' do

    it 'expects a plane to be initilized with the default status, not landed' do
      expect(subject.landed?).to eq(false)
    end

  end

  describe 'landed?' do

    it 'expects it to be able to confirm if a plane is landed' do
      is_expected.to respond_to(:landed?)
    end

  end

  describe 'is_landed' do

    it 'expects it to be able to change the value of landed to true' do
      subject.is_landed
      expect(subject.landed?).to eq true
    end

  end

  describe 'took_off' do

        it 'expects it to be able to change the value of landed to true' do
          subject.took_off
          expect(subject.landed?).to eq false
        end

  end

end
