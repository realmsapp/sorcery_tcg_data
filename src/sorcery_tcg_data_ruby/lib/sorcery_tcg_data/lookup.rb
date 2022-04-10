require "date"

module SorceryTcgData
  class Lookup
    def self._load(path, &)
      spec = Gem::Specification.find_by_name("sorcery_tcg_data_ruby")
      YAML.safe_load(File.read(File.join(spec.gem_dir, "data/en/", path))).each_with_object({}) do |attributes, memo|
        item = yield(attributes.map { |a,v| [a.to_sym, v] }.to_h)
        memo[item.key] = item
      end
    end

    private_class_method :_load

    ARTISTS = _load("artists.yaml") { |item| Artists::Artist.new(**item) }.freeze
    FORMATS = _load("formats.yaml") { |item| Formats::Format.new(**item) }.freeze
    RELEASES = _load("releases.yaml") { |item| Releases::Release.new(**item) }.freeze
    RARITIES = _load("rarities.yaml") { |item| Rarities::Rarity.new(**item) }.freeze
    ELEMENTS = _load("elements.yaml") { |item| Elements::Element.new(**item) }.freeze
    CARD_TYPES = _load("card_types.yaml") { |item| CardTypes::CardType.new(**item) }.freeze

    def self.artist(key, &) = ARTISTS.fetch(key, &)
    def self.format(key, &) = FORMATS.fetch(key, &)
    def self.release(key, &) = RELEASES.fetch(key, &)
    def self.rarity(key, &) = RARITIES.fetch(key, &)
    def self.element(key, &) = ELEMENTS.fetch(key, &)
    def self.card_type(key, &) = CARD_TYPES.fetch(key, &)
    def self.card(key, &) = CARDS.fetch(key, &)

    CARDS = _load("cards/alpha/cards.yaml") { |item| Card.make(self, **item) }.freeze
  end
end