require 'plane'

describe Plane do

   describe 'report_landed' do
     it 'can be reported as landed' do
       subject.report_landed
       expect(subject).to be_landed
     end
   end

   describe 'report_take_off' do
     it 'can be reported as taken off' do
       subject.report_take_off
       expect(subject).to_not be_landed
     end
   end

end
