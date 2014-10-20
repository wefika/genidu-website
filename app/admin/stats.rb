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

          div column_chart(product.unique_chart_data), class: 'basic-data'
          div class: 'clearfix'
        end

        panel "Geo stats" do
          div geo_chart(product.geo_chart_data, height: "700px")
          div pie_chart(product.pie_chart_data)
        end
      end

    end
  end # content
end
