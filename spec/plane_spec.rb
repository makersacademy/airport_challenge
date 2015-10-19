require 'plane'

describe Plane do
  let(:id) { "BA535" }
  subject { Plane.new id }
  context 'Identifying oneself' do
    it { is_expected.to respond_to :id }
    it 'Returns its ID when asked' do
      expect(subject.id).to eq id
    end
  end
  context 'Its Location' do
    it { is_expected.to respond_to(:location) }
  end
  context 'Reporting its flying state' do
    it { is_expected.to respond_to :flying }
    it 'Returns its flying state when asked' do
      expect(subject.flying).to be false
    end
  end
  context 'Altering its flying state' do
    it { is_expected.to respond_to(:flying=).with(1).argument}
    it 'Changes its flying state when asked' do
      expect(subject.flying = true).to be true
    end
  end
end
