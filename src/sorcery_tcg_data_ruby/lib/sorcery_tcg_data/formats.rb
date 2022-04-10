# frozen_string_literal: true

module SorceryTcgData
  module Formats
    class Format
      include ValueSemantics.for_attributes {
        key
        name
      }
    end

    ALL = Lookup.load("formats.yaml") { |item| Format.new(**item) }.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end
