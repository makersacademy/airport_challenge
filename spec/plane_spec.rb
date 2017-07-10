require 'plane'

describe Plane do

  it { is_expected.to respond_to :report_grounded }

  describe '#initialize' do

    it 'initializes' do
      expect(subject).not_to be_nil
    end

    it 'generates a name' do
      expect(subject.name).not_to be_nil
    end
  end

  describe '#report_grounded' do

    it 'sets grounded to true' do
      subject.report_grounded
      expect(subject.grounded).to eq true
    end
  end

  describe '#report_airborne' do

    it 'sets grounded to false' do
      subject.report_airborne
      expect(subject.grounded).to eq false
    end
  end

end
