# frozen_string_literal: true

RSpec.describe LogParser::Processing::MostUniqueVisited do
  subject { described_class }

  let(:description) { 'List of webpages with most unique page views' }
  let(:loaded_data) do
    [
      LogParser::LogLine.call('/home 127.0.0.1'),
      LogParser::LogLine.call('/about 127.0.0.1'),
      LogParser::LogLine.call('/about 127.0.0.1'),
      LogParser::LogLine.call('/about 127.0.0.1'),
      LogParser::LogLine.call('/about 127.0.0.5')
    ]
  end
  let(:expected_output) { [['/home', 1], ['/about', 2]] }

  describe '.perform' do
    it { expect(subject.perform(loaded_data)).to eq(expected_output) }
  end

  describe '.description' do
    it { expect(subject.description).to eq(description) }
  end
end
