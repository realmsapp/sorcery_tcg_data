# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

require "yaml"
require "terminal-table"
require "debug"
require "active_support/all"

def load(&block)
  Dir.glob("./data/en/cards/**/*.yaml").each do |set|
    set_file = File.read(set)
    YAML.load(set_file).each do |card|
      identifier = card["identifier"]
      image_path = Pathname.new(set).parent.join("images").join("#{identifier}.png")
      web_image_path = Pathname.new(set).parent.join("images").join("#{identifier}-small.png")

      yield(identifier, image_path, web_image_path)
    end
  end
end

task :report do |_task, _args|
  rows = []
  load do |name, image_path, web_image_path|
    has_image = File.exist?(image_path)
    has_web_image = File.exist?(web_image_path)

    unless has_image && has_web_image
      rows << [name, has_image, has_web_image]
    end
  end

  puts Terminal::Table.new(
    title: "Cards",
    headings: ["Card", "Image", "Web Image"],
    rows: rows.sort_by { |a| a[0] },
  )
end

task :convert do |_task, _args|
  load do |_name, image_path, web_image_path|
    has_image = File.exist?(image_path)
    has_web_image = File.exist?(web_image_path)

    if has_image && !has_web_image
      `convert -geometry x420 #{image_path} #{web_image_path}`
    end
  end
end

task :download do |_task, _args|
  sheet = "Sheet1"
  sheet_id = "1abqOMZAtY971WjEQqFdhXfiR-xxAFY6X-T4hNnhQX1M"
  doc = "https://docs.google.com/spreadsheets/d/#{sheet_id}/gviz/tq?tqx=out:csv&sheet=#{sheet}"

  `wget --output-document=temp.csv #{doc}`
end

require "csv"
task :extract do |_task, _args|
  cards = {}
  load do |id, _, _|
    cards[id] = {}
  end
  csv = CSV.read("./temp.csv").slice(1..)
  csv.each_with_object([]) do |row, memo|
    maybe_id = row[0].gsub(/\s/, "_").strip.downcase.underscore
    if cards[maybe_id] && row[24].present?
      cards[maybe_id]["keywords"] = row[24].split(",").map(&:strip).map { |a| a.gsub(/\s/, "_").downcase.underscore }
    elsif row[24].present?
    end
  end

  puts YAML.dump(cards.select { |a,b| b.present? })

  # source = YAML.load(File.read("./data/en/cards/alpha/cards.yaml"))
  # additions = cards.select { |id, val| val["keywords"].present? }

  # additions.each do |key, val|
  #   card = source.find { |c| c["identifier"] == key }
  #   card.merge!(val)
  # end

  # result = source.sort_by { |a| a["name"] }
  # Combine
  # File.write("./data/en/cards/alpha/cards.yaml", YAML.dump(result))
end

task default: :test