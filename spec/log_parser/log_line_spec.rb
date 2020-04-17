# frozen_string_literal: true

RSpec.describe LogParser::LogLine do
  subject { described_class.call(log_line) }

  let(:url) { '/home' }
  let(:ip) { '127.0.0.1' }
  let(:log_line) { '/home 127.0.0.1' }

  describe '#initialize' do
    it 'has a valid url attribute' do
      expect(subject.url).to eq(url)
    end

    it 'has a valid ip attribute' do
      expect(subject.ip).to eq(ip)
    end
  end
end
