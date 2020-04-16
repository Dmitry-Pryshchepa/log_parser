# frozen_string_literal: true

RSpec.describe LogParser::Printer do
  subject { described_class.perform(input_data) }

  let(:input_data) { "\n\n/home 4\n/about 1\n\n" }

  describe '.perform' do
    it 'writes to stdout' do
      expect { subject }.to output("\n\n/home 4\n/about 1\n\n").to_stdout
    end
  end
end
