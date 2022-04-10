# frozen_string_literal: true

module SorceryTcgData
  module Rarities
    class Rarity
      include ValueSemantics.for_attributes {
        key String
        name String
      }
    end

    ALL = Lookup.load("rarities.yaml") { |item| Rarity.new(**item) }.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end
