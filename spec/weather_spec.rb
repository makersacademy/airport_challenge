require 'weather'

describe Weather do

  it{is_expected.to respond_to :report}

  it{is_expected.to respond_to :forecast}

  it 'should report that the weather is sunny' do
    expect(subject.report).to eq 'sunny'
  end

  it 'should report when the weather is stormy' do
    expect(subject.report).to eq 'stormy'
  end



end
