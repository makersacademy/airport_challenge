require 'weather'

describe Weather do
  it { is_expected.to respond_to :met_report }
  it 'returns the current weather' do
    weather = Weather.new
    subject.met_report
    expect(subject.met_report).to eq("sun").or(eq("stormy"))
  end
end
