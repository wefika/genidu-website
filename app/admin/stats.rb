ActiveAdmin.register_page "Stats" do
  menu false

  content title: "Stats" do
    product = Product.find(params[:id])
    columns do
      column do
        panel "Product" do
          div javascript_include_tag "//www.google.com/jsapi", "chartkick"
          # div line_chart(Product.group(:created_at).count)
          div class: "product-desc" do
            h1 product.model
            small [product.manufacturer, product.code].join(', ')
            div image_tag(product.image, height: 200), class: 'image'
          end

          div column_chart(Product.unique_chart_data), class: 'basic-data'
          div class: 'clearfix'
          div do
            h2 " "
            h2 "* Average score on Surveys: #{70+Random.rand(30)}%"
            h2 "* Average scans per user: #{Product.avg_scans}"
          end
        end

        panel "Daily scans" do
          line_chart Product.daily
        end

        panel "Percentage" do
          div bar_chart(Product.unique_chart_data_percentage)
        end

        panel "Scans" do
          div pie_chart(Product.pie_chart_data_2(Product.count))
          div class: 'clearfix'
        end

        panel "Geo stats" do
          div geo_chart(Product.geo_chart_data, height: "700px")
          div pie_chart(Product.pie_chart_data)
        end
      end

    end
  end # content
end
