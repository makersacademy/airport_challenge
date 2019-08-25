require './lib/plane'

describe 'Plane' do
  subject { Plane.new('BA165') }

  it 'has a call sign' do
    expect(subject.call_sign).to eq 'BA165'
  end
end