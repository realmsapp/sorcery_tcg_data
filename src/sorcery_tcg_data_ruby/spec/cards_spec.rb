# frozen_string_literal: true

RSpec.describe SorceryTcgData::Cards do
  describe ".fetch" do
    it "finds set card card metadata by card_key" do
      card = SorceryTcgData::Cards.fetch("accursed_albatross")

      expect(card.identifier).to eq("accursed_albatross")
      expect(card.rarity.key).to eq("exceptional")
      expect(card.rarity).to be_exceptional
      expect(card.elements.map(&:key)).to eq(["water"])
      expect(card.card_type.key).to eq("minion")
      expect(card.artist.key).to eq("vincent_pompetti")
      expect(card.keywords.map(&:key)).to eq(["airborne"])
      expect(card.tts_beta?).to eq(true)
    end
  end
end
