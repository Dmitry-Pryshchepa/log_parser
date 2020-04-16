# frozen_string_literal: true

require 'open3'

RSpec.describe 'bin/parser' do
  subject { Open3.capture3(run_script) }

  let(:run_script) { "./bin/parser #{source}" }

  describe 'script execution' do
    context 'when file argument is valid' do
      let(:source) { File.join('spec', 'fixtures', 'webserver.log') }

      it 'provides not empty output' do
        expect(subject[0]).not_to be_empty
      end

      it 'does not provide errors' do
        expect(subject[1]).to be_empty
      end
    end

    context 'when file not exist' do
      let(:source) { File.join('spec', 'fixtures', 'invalid_path.log') }

      it 'does not provide output' do
        expect(subject[0]).to be_empty
      end

      it 'provides output with FileNotFound error' do
        expect(subject[1]).to include('FileNotFound')
      end
    end

    context 'when file is empty' do
      let(:source) { File.join('spec', 'fixtures', 'empty_log.log') }

      it 'does not provide output' do
        expect(subject[0]).to be_empty
      end

      it 'provides output with EmptyFile error' do
        expect(subject[1]).to include('EmptyFile')
      end
    end

    context 'when file not specified' do
      let(:source) {}

      it 'does not provide output' do
        expect(subject[0]).to be_empty
      end

      it 'provides output with ArgumentError' do
        expect(subject[1]).to include('ArgumentError')
      end
    end
  end
end
