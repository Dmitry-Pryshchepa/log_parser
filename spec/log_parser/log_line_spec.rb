# frozen_string_literal: true

RSpec.describe LogParser::LogLine do
  subject { described_class.new(url, ip) }

  let(:url) { '/home' }
  let(:ip) { '127.0.0.1' }

  describe '#initialize' do
    it 'has a valid url attribute' do
      expect(subject.instance_variable_get(:@url)).to eq(url)
    end

    it 'has a valid ip attribute' do
      expect(subject.instance_variable_get(:@ip)).to eq(ip)
    end
  end
end
