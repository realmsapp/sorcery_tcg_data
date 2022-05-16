# frozen_string_literal: true

module SorceryTcgData
  module Cards
    class Card
      def self.make(data)
        new(
          identifier: data.fetch(:identifier),
          rarity: Rarities.fetch(data.fetch(:rarity)),
          card_type: CardTypes.fetch(data.fetch(:card_type)),
          release: Releases.fetch("alpha"),
          artist: Artists.fetch(data.fetch(:artist)),
          keywords: data.fetch(:keywords, []).map { |kw| Keywords.fetch(kw) },
          name: data.fetch(:name),
          initial_life: data.fetch(:initial_life, nil)&.to_s,
          rules_box: data.fetch(:rules_box, nil),
          type_line: data.fetch(:type_line, nil),
          mana_cost: data.fetch(:mana_cost, nil),
          power: data.fetch(:power, nil),
          flavor_text: data.fetch(:flavor_text, nil),
          earth_threshold: data.fetch(:earth_threshold, nil),
          fire_threshold: data.fetch(:fire_threshold, nil),
          water_threshold: data.fetch(:water_threshold, nil),
          wind_threshold: data.fetch(:wind_threshold, nil),
          elements: [
            data[:earth_threshold] && Elements.fetch("earth"),
            data[:fire_threshold] && Elements.fetch("fire"),
            data[:water_threshold] && Elements.fetch("water"),
            data[:wind_threshold] && Elements.fetch("wind"),
          ].compact,
        )
      end

      include ValueSemantics.for_attributes {
        identifier String
        rarity Rarities::Rarity
        card_type CardTypes::CardType
        release Releases::Release
        artist Artists::Artist
        keywords ArrayOf(Keywords::Keyword), default: []
        elements ArrayOf(Elements::Element), default: []
        name String
        initial_life Either(String, nil)
        rules_box Either(String, nil)
        type_line Either(String, nil)
        mana_cost Either(String, nil)
        earth_threshold Either(String, nil)
        fire_threshold Either(String, nil)
        water_threshold Either(String, nil)
        wind_threshold Either(String, nil)
        power Either(String, nil)
        flavor_text Either(String, nil)
      }

      def attributes
        {
          identifier:,
          rarity: rarity.key,
          card_type: card_type.key,
          release: release.key,
          artist: artist.key,
          keywords: keywords.map(&:key),
          name:,
          initial_life:,
          rules_box:,
          type_line:,
          mana_cost:,
          power:,
          flavor_text:,
          earth_threshold:,
          fire_threshold:,
          water_threshold:,
          wind_threshold:,
        }.reject { |_a, b| b.blank? }.to_h
      end

      def key
        identifier
      end

      def tts_beta?
        BetaFiles::ALL.key?(name)
      end
    end

    def self.lookup
      @lookup ||= Lookup.load("cards/*/cards.yaml") { |item| Card.make(item) }
    end

    def self.fetch(key, *args)
      lookup.fetch(key, *args)
    end
  end
end
