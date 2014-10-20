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

  def self.unique_chart_data n=1
    uniq = Random.rand(scale*5*n)
    {
      "Unique users" => uniq,
      "All scans" => (uniq*2 + Random.rand(scale*5*n))
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

  def self.scale
    @scale ||= ENV['scale'] || 1000
  end

end
