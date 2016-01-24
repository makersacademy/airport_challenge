require 'airplane'

describe Airplane do
  subject(:Airplane) {described_class.new}
	let(:control) { double :control }
  let(:airport) { double :airport }

  it { is_expected.to respond_to(:report_landed).with(1).argument }

  describe 'report_landed' do
  	it 'plane can be reported as landed' do
  		subject.report_landed(airport)
  		expect(subject.landed).to be true
  	end
    # it 'plane location now an airport' do
  	# 	subject.report_landed(airport)
  	# 	expect(subject.location).to be_an_instance_of Airport
  	# end
  end

  describe 'report_inflight' do
    it 'plane can be reported as inflight' do
  		subject.report_inflight
  		expect(subject.landed).to be false
  	end
    # it 'plane no longer has airport location' do
  	# 	subject.report_inflight
  	# 	expect(subject.location).to be nil
  	# end
  end

end
