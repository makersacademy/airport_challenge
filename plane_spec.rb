require 'plane'

it {is_expected.to repond_to :landed?}

it 'can be confirmed landed' do
  subject.report_landed
  expect(subject).to be_landed
end
