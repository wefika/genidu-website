class Product < ActiveRecord::Base

  # Attributes
  #
  # model
  # image
  # code
  # url
  # manufacturer
  #

  mount_uploader :image, ImageUploader

  def self.daily n=1
    (1..30).to_a.reverse.map{|x|
      [x.days.ago, Random.rand(scale*n)]
    }
  end

  def self.avg_scans
    uniq = Random.rand(scale*5)
    ((uniq*2 + Random.rand(scale*5)) / uniq)
  end

  def self.unique_chart_data n=1
    uniq = Random.rand(scale*5*n)
    {
      "Unique users" => uniq,
      "All scans" => (uniq*2 + Random.rand(scale*5*n)),
      "Scans with completed Survey" => (uniq*2 + Random.rand(scale*n)),
      "Scans shared online" => (uniq*2 + Random.rand(scale*n)),
      "Unique tags scanned" => (uniq*Random.rand).to_i
    }
  end

  def self.unique_chart_data_percentage n=1
    total = 100
    {
      "Unique users" => Random.rand(10)+15,
      "Scans with completed Survey" => Random.rand(10)+25,
      "Scans shared online" => Random.rand(10)+35,
      "Unique tags scanned" => Random.rand(10)+45
    }
  end

  def self.geo_chart_data n=1
    countries = %w(UK France Italy Germany USA China Autralia)
    countries.map{|c| [c, Random.rand(scale*n)]}
  end

  def self.pie_chart_data n=1
    countries = %w(Americans Chinese British French Italians Germans Austrians)
    countries.map{|c| [c, Random.rand(scale*n)]}
  end

  def self.pie_chart_data_2 n=1
    [
      ["Shop", (Random.rand(scale*n)*0.6).to_i],
      ["Internet", (Random.rand(scale*n)*0.3).to_i],
      ["Second Hand", (Random.rand(scale*n)*0.05).to_i],
      ["Other", (Random.rand(scale*n)*0.05).to_i]
    ]
  end

  def self.scale
    @scale ||= ENV['scale'] || 1000
  end

end
