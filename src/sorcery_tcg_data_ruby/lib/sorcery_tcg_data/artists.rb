module SorceryTcgData
  module Artists
    class Artist
      include ValueSemantics.for_attributes {
        key String
        name String
      }
    end

    ALL = Lookup.load("artists.yaml") { |item| Artist.new(**item) }.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end