require 'plane'

describe Plane do
   subject(:plane) { described_class.new }
   it { expect(subject).to respond_to(:at_airport?) }

   describe '#at_airport?' do
     it 'confirm plane is not at airport at start' do
       expect(subject).not_to be_at_airport
     end

     it 'confirms plane is at airport after landing' do
       subject.landed
       expect(subject).to be_at_airport
     end
   end

  describe '#landed' do
    it 'change status of plane to at aiport' do
			subject.landed
			expect(subject).to be_at_airport
		end
  end


end
