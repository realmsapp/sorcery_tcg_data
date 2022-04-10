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

task :upload do |_task, _args|
  load do |name, image_path, web_image_path|
    unless has_image && has_web_image
      table.add_row([name, has_image, has_web_image])
    end
  end
end

task :extract do |_task, _args|
  sheet = "Sheet1"
  sheet_id = "1abqOMZAtY971WjEQqFdhXfiR-xxAFY6X-T4hNnhQX1M"
  doc = "https://docs.google.com/spreadsheets/d/#{sheet_id}/gviz/tq?tqx=out:csv&sheet=#{sheet}"

  `wget --output-document=temp.csv #{doc}`
end

require "csv"
task :transform do |_task, _args|
  names = []
  load do |name, _, _|
    names << name.downcase
  end
  csv = CSV.read("./temp.csv").slice(1..)
  missing = csv.each_with_object([]) do |row, memo|
    if !names.include?(row[0].gsub(/[^a-zA-Z]+/, "").downcase)
      memo << {
        "name" => row[0],
        "card_type" => row[5].downcase,
        "rarity" => row[9].downcase,
        "rules_box" => row[3],
        "type_line" => row[2],
        "flavor_text" => row[4],
        "element" => "",
        "power" => row[20],
        "artist" => row[25].gsub(/[^a-zA-Z]+/, "_").downcase,
        "identifier" => row[0].gsub(/[^a-zA-Z]+/, "_").downcase,
        "release" => 'alpha',
        "mana_cost" => row[10],
        "earth_threshold" => [row[12], row[16]].find { |a| !a.empty? && a != "0" },
        "fire_threshold" => [row[14], row[18]].find { |a| !a.empty? && a != "0" },
        "water_threshold" => [row[11], row[15]].find { |a| !a.empty? && a != "0" },
        "wind_threshold" => [row[13], row[17]].find { |a| !a.empty? && a != "0" },
      }.compact.reject { |k,v| v.empty? }
    end
  end

  puts missing.count

  puts YAML.dump(missing).to_s
end

task default: :test