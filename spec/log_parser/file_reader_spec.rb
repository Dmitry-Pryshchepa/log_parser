# frozen_string_literal: true

RSpec.describe LogParser::FileReader do
  subject { described_class.call(file) }

  let(:file) { File.join('spec', 'fixtures', 'webserver.log') }
  let(:example_line) { ['/home 127.0.0.1'] }

  describe '.call' do
    context 'when right file' do
      it 'reads from file' do
        expect(File).to receive(:readlines).with(file).and_return(example_line)

        subject
      end
    end

    context 'when file not found' do
      subject { described_class.call(wrong_file) }

      let(:wrong_file) { File.join('spec', 'webserver.log') }

      it { expect { subject }.to raise_error(LogParser::FileReader::FileNotFound) }
    end

    context 'when empty file' do
      subject { described_class.call(empty_file) }

      let(:empty_file) { File.join('spec', 'fixtures', 'empty_log.log') }

      it { expect { subject }.to raise_error(LogParser::FileReader::EmptyFile) }
    end
  end
end
