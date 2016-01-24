require 'airplane'

describe Airplane do
  subject(:Airplane) {described_class.new}
	let(:control) { double :control }
  let(:airport) { double :airport }

  it { is_expected.to respond_to(:report_landed).with(1).argument }

	it 'plane can be reported as landed' do
		subject.report_landed(airport)
		expect(subject.landed).to be true
	end
  it 'plane can be reported as inflight' do
		subject.report_inflight
		expect(subject.landed).to be false
	end

end
