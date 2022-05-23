require "debug"
# frozen_string_literal: true

module SorceryTcgData
  module BetaFiles
    class BetaFile
      extend Slugify

      class ParseError < StandardError; end

      def self._clean(attrs, thing)
        attrs.fetch(thing).presence || nil
      end

      def self.parse(attrs)
        frame         = _clean(attrs, :Frame)
        rarity        = Rarities.fetch(to_slug(_clean(attrs, :Rarity)).presence || "unknown")
        types         = _clean(attrs, :Types)
        name          = _clean(attrs, :Name)&.encode
        cost          = _clean(attrs, :Cost)
        threshold     = _clean(attrs, :Threshold) || ""
        card_text     = _clean(attrs, :"Card Text")&.encode
        grid1         = _clean(attrs, :Grid1)
        grid2         = _clean(attrs, :Grid2)
        power         = _clean(attrs, :Power)
        type_sentence = _clean(attrs, :"Type sentence")&.encode
        flavor        = _clean(attrs, :Flavor)&.encode
        artist        =  Artists.fetch(to_slug(_clean(attrs, :Artist) || "unknown")&.encode)
        face_url      = _clean(attrs, :FaceURL)

        thresholds = threshold.chars.each_with_object({}) do |letter, memo|
          memo[letter] ||= 0
          memo[letter] += 1
        end
        card_type, *keywords = types.split(", ")
        card_type = CardTypes.fetch(to_slug(card_type))
        keywords = keywords.map { |k| Keywords.fetch(to_slug(k)) }

        new(
          frame:,
          rarity:,
          card_type:,
          keywords:,
          artist:,
          name:,
          cost:,
          power:,
          grid1:,
          grid2:,
          earth_threshold: thresholds.fetch("E", nil)&.to_s,
          fire_threshold: thresholds.fetch("F", nil)&.to_s,
          water_threshold: thresholds.fetch("W", nil)&.to_s,
          air_threshold: thresholds.fetch("A", nil)&.to_s,
          type_line: type_sentence,
          rules_box: card_text,
          flavor_text: flavor,
        )
      rescue => e
        raise ParseError, attrs.inspect
      end

      include ValueSemantics.for_attributes {
        name String
        frame Either(String, nil)
        rarity Rarities::Rarity
        card_type CardTypes::CardType
        keywords ArrayOf(Keywords::Keyword), default: []
        artist Artists::Artist
        cost Either(String, nil)
        power Either(String, nil)
        grid1 Either(String, nil)
        grid2 Either(String, nil)
        earth_threshold Either(String, nil)
        fire_threshold Either(String, nil)
        water_threshold Either(String, nil)
        air_threshold Either(String, nil)
        type_line Either(String, nil)
        rules_box Either(String, nil)
        flavor_text Either(String, nil)
      }

      def key
        name
      end
    end

    CURRENT_VERSION = "2022-05-23"
    ALL = Lookup.load("beta_files/#{CURRENT_VERSION}.json") do |item|
      BetaFile.parse(item)
    end.freeze

    def self.fetch(key, *args) = ALL.fetch(key, *args)
  end
end
