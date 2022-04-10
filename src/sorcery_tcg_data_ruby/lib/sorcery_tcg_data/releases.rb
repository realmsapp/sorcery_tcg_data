# frozen_string_literal: true

require "date"

module SorceryTcgData
  module Releases
    class Release
      include ValueSemantics.for_attributes {
        key
        name
        release_date
        notes
      }
    end

    ALL = Lookup.load("releases.yaml") { |item| Release.new(**item) }.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end
