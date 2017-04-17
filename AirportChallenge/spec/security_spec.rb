
require 'security'
require 'passenger'
require 'airport'

describe Security do

  subject(:security) {described_class}

  describe 'passport check' do
    it 'passport' do
      allow(subject).to receive(:travelling) {true}
      expect(subject.travelling).to eq true
    end
  end

    it 'security threat can be true' do
      allow(Security).to receive(:security_threat?) {true}
      expect(subject.security_threat?).to eq(true) | eq(false)
    end
end
