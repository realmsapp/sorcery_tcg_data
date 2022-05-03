# frozen_string_literal: true

module SorceryTcgData
  module BetaFiles
    class BetaFile
      include ValueSemantics.for_attributes {
        name String
        url String
      }

      def key
        name
      end
    end

    ALL = Lookup.load("beta_files.yaml") { |item| BetaFile.new(**item) }.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end
