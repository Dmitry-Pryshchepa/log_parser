# frozen_string_literal: true

RSpec.describe LogParser::Loader do
  subject { described_class.call(file, reader: file_reader, builder: data_builder) }

  let(:file) { File.join('spec', 'fixtures', 'webserver.log') }
  let(:example_line) { ['/home 127.0.0.1'] }
  let(:file_reader) { LogParser::FileReader }
  let(:data_builder) { LogParser::DataBuilder }

  describe '.call' do
    it 'performs data loading' do
      expect(file_reader).to receive(:call).with(file).and_return(example_line)
      expect(data_builder).to receive(:call).with(example_line)

      subject
    end
  end
end
