require "debug"
module SorceryTcgData
  class Card
    def self.make(lookup, data)
      new(
        identifier: data.fetch(:identifier),
        rarity: lookup.rarity(data.fetch(:rarity)),
        element: lookup.element(data.fetch(:element, "none")),
        card_type: lookup.card_type(data.fetch(:card_type)),
        release: lookup.release(data.fetch(:release)),
        artist: lookup.artist(data.fetch(:artist)),
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
      )
    end

    include ValueSemantics.for_attributes {
      identifier String
      rarity Rarities::Rarity
      element Elements::Element
      card_type CardTypes::CardType
      release Releases::Release
      artist Artists::Artist
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

    def key
      identifier
    end
  end
end