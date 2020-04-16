# frozen_string_literal: true

RSpec.describe LogParser::Executor do
  subject { described_class.new(file) }

  let(:file) { File.join('spec', 'fixtures', 'webserver.log') }

  describe '#initialize' do
    it { expect(subject.instance_variable_get(:@source)).to eq(file) }
  end

  describe '#perform' do
    it 'proceeds parsing' do
      expect(LogParser::Printer).to receive(:perform).twice
      expect(LogParser::Processing::Sorter).to receive(:perform).twice
      expect(LogParser::Processing::Decorator).to receive(:perform).twice
      subject.perform
    end
  end
end
