require 'plane'

describe Plane do
  context '#land' do
    it { is_expected.to respond_to(:land) }
    it 'should return landed status' do
      expect(subject.land).to eq 'The plane has landed!'
    end
  end

 context '#take_off' do
   it { is_expected.to respond_to(:take_off) }
   it 'should return take off status' do
     expect(subject.take_off).to eq 'The plane has taken off!'
   end
 end
end
