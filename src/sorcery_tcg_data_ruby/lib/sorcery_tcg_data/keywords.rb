# frozen_string_literal: true

module SorceryTcgData
  module Keywords
    class Keyword
      include ValueSemantics.for_attributes {
        key String
        name String
        description Either(String, nil)
      }
    end

    ALL = Lookup.load("keywords.yaml") { |item| Keyword.new(**item) }.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end
