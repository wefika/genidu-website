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

  def unique_chart_data
    uniq = Random.rand(scale*5)
    {
      "Unique users" => uniq,
      "All scans" => (uniq*2 + Random.rand(scale*5))
    }
  end

  def geo_chart_data
    countries = %w(UK France Italy Germany USA China Autralia)
    countries.map{|c| [c, Random.rand(scale)]}
  end

  def pie_chart_data
    countries = %w(Americans Chinese British French Italians Germans Austrians)
    countries.map{|c| [c, Random.rand(scale)]}
  end

  def scale
    @scale ||= ENV['scale'] || 1000
  end

end
