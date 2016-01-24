
require 'passenger'

describe Passenger do

  subject(:passenger) {described_class.new("Scott", 50000)}

  describe 'Security' do
    it 'travelling' do
      subject.travelling
      expect(subject.permission).to eq true
    end

    it 'security failed' do
      subject.not_travelling
      expect(subject.permission).to eq false
    end

    it 'accepts two arguments and creates instance variables' do
      expect(subject.name).to start_with("S") & end_with("t")
    end
  end
end
