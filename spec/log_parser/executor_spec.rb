# frozen_string_literal: true

RSpec.describe LogParser::Executor do
  subject { described_class.new(file).perform }

  let(:file) { File.join('spec', 'fixtures', 'webserver.log') }
  let(:correct_output) { File.join('spec', 'fixtures', 'correct_script_output') }
  let(:number_of_calls) { LogParser::Executor::PROCESSORS.count }

  describe '#perform' do
    it 'proceeds parsing by the number of processors' do
      expect(LogParser::Printer).to receive(:perform).exactly(number_of_calls).times
      expect(LogParser::Processing::Sorter).to receive(:perform).exactly(number_of_calls).times
      expect(LogParser::Processing::Decorator).to receive(:perform).exactly(number_of_calls).times

      subject
    end

    it 'provides valid output' do
      expect { subject }.to output(File.read(correct_output)).to_stdout
    end
  end
end
