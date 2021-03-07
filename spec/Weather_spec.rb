require 'Weather'

describe Weather do
  it { is_expected.to respond_to :forecast }

  it 'Describes the weather as stormy or fine' do
    expect(subject.forecast).to eq("fine").or(eq("stormy"))
  end
end
