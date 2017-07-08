require 'plane'

describe Plane do

  it { is_expected.to respond_to :report_landed }

  describe '#initialize' do

    it 'initializes' do
      expect(subject).not_to be_nil
    end

    it 'generates a name' do
      expect(subject.name).not_to be_nil
    end
  end

  describe '#report_landed' do

    it 'sets landed to true' do
      subject.report_landed
      expect(subject.landed).to eq true
    end
  end

  describe '#report_airborne' do

    it 'sets landed to false' do
      subject.report_airborne
      expect(subject.landed).to eq false
    end
  end

end
