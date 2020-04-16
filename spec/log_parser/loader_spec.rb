# frozen_string_literal: true

RSpec.describe LogParser::Loader do
  subject { described_class.new(file) }
  let(:file) { File.join('spec', 'fixtures', 'webserver.log') }
  let(:example_line) { ['/home 127.0.0.1'] }

  describe '#initialize' do
    context 'when right file' do
      it { expect(subject.instance_variable_get(:@source)).to eq(file) }
    end

    context 'when file not found' do
      let(:wrong_file) { File.join('spec', 'webserver.log') }
      subject { described_class.new(wrong_file) }

      it { expect { subject }.to raise_error(LogParser::Loader::FileNotFound) }
    end

    context 'when empty file' do
      let(:empty_file) { File.join('spec', 'fixtures', 'empty_log.log') }
      subject { described_class.new(empty_file) }

      it { expect { subject }.to raise_error(LogParser::Loader::EmptyFile) }
    end
  end

  describe '#perform' do
    it 'reads from file' do
      expect(File).to receive(:readlines).with(file).and_return(example_line)
      subject.perform
    end

    it 'creates log_line objects' do
      expect(subject.perform.sample).to be_a_kind_of(LogParser::LogLine)
    end
  end
end
