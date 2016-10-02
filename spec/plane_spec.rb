require 'plane'

describe Plane do

  it {is_expected.to respond_to :landed?}

  describe 'initialization' do
    it 'defaults to landed' do
      expect(described_class.new.landed?).to eq true
    end
  end

  it 'can be marked as landed' do
    subject.report_landed
    expect(subject.landed?).to eq true
  end

end
