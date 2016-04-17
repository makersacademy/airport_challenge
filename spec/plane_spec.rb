require 'plane'

describe Plane do
   it {is_expected.to respond_to :flying?}
   it {is_expected.to respond_to :report_landed}
   it 'reports the plane is flying' do
   	subject.report_landed
   	expect(subject.flying?).to eq false
   end
end