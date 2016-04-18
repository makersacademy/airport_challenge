require 'plane'

describe Plane do
	let(:plane) {subject}
  	it {is_expected.to respond_to :flying?}
  	it {is_expected.to respond_to :report_landed}
  	it 'reports the plane is flying' do
   	plane.report_landed
   	expect(plane.flying?).to eq false
   end
end