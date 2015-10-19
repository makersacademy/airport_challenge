require 'plane'
describe Plane do

  context 'whilst flying' do

    it 'cannot take off' do
      expect{ subject.take_off }.to raise_error 'already flying' 
    end

    it 'can land' do
      expect{ subject.land }.not_to raise_error
    end
  end

  context 'whilst landed' do
 
    before do
      subject.land
    end

    it 'can take off' do
      expect{ subject.take_off }.not_to raise_error
    end

    it 'cannot land' do
      expect{ subject.land }.to raise_error 'already landed'
    end
  end
end
