# frozen_string_literal: true

module LogParser
  class Loader
    private_class_method :new

    def self.call(source, reader: FileReader, builder: DataBuilder)
      new(source, reader, builder).perform
    end

    def initialize(source, reader, builder)
      @source = source
      @reader = reader
      @builder = builder
    end

    def perform
      builder.call(reader.call(source))
    end

    private

    attr_reader :source, :reader, :builder
  end
end
