# frozen_string_literal: true

module LogParser
  class FileReader
    class FileNotFound < StandardError; end
    class EmptyFile < StandardError; end

    private_class_method :new

    def self.call(source)
      new(source).perform
    end

    def initialize(source)
      @source = source
      validate!
    end

    def perform
      File.readlines(source)
    end

    private

    attr_reader :source

    def validate!
      raise FileNotFound unless File.exist?(source)
      raise EmptyFile if File.empty?(source)
    end
  end
end
