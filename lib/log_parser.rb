# frozen_string_literal: true

require_relative 'log_parser/processing/decorator'
require_relative 'log_parser/processing/most_visited'
require_relative 'log_parser/processing/most_unique_visited'
require_relative 'log_parser/processing/sorter'

require_relative 'log_parser/data_builder'
require_relative 'log_parser/executor'
require_relative 'log_parser/file_reader'
require_relative 'log_parser/loader'
require_relative 'log_parser/log_line'
require_relative 'log_parser/printer'

module LogParser
  def self.start(file_path)
    LogParser::Executor.new(file_path).perform
  end
end
