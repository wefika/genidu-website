ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "All Products" do
          div javascript_include_tag "//www.google.com/jsapi", "chartkick"
          # div line_chart(Product.group(:created_at).count)
          ul do
            Product.all.map do |p|
              li link_to("#{p.manufacturer}, #{p.model}", admin_stats_path(id: p.id))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Product" do
          # div javascript_include_tag "//www.google.com/jsapi", "chartkick"
          div column_chart(Product.unique_chart_data(Product.count))
          div class: 'clearfix'
          div do
            h2 " "
            h2 "* Average score on Surveys: #{70+Random.rand(30)}%"
            h2 "* Average scans per user: #{Product.avg_scans}"
          end
        end

        panel "Daily scans" do
          line_chart Product.daily(Product.count)
        end

        panel "Percentage" do
          div bar_chart(Product.unique_chart_data_percentage)
        end

        panel "Scans" do
          div pie_chart(Product.pie_chart_data_2(Product.count))
          div class: 'clearfix'
        end

        panel "Geo stats" do
          div geo_chart(Product.geo_chart_data(Product.count), height: "700px")
          div pie_chart(Product.pie_chart_data(Product.count))
        end
      end

    end
  end # content
end
