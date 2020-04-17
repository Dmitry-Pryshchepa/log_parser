# frozen_string_literal: true

RSpec.describe LogParser::DataBuilder do
  subject { described_class.call(source, line_builder: line_builder) }

  let(:source) { ['/home 127.0.0.1'] }
  let(:example_line) { '/home 127.0.0.1' }
  let(:line_builder) { LogParser::LogLine }

  describe '.call' do
    it 'creates log_line objects' do
      expect(subject.sample).to be_a_kind_of(LogParser::LogLine)
    end

    it 'initiates line creating' do
      expect(line_builder).to receive(:new).with(*example_line.split)

      subject
    end
  end
end
