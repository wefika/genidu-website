ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        # panel "Recent Posts" do
        #   ul do
        #     Post.recent(5).map do |post|
        #       li link_to(post.title, admin_post_path(post))
        #     end
        #   end
        # end
        panel "Something" do
          div javascript_include_tag "//www.google.com/jsapi", "chartkick"
          # div line_chart(Product.group(:created_at).count)
          ul do
            Product.all.map do |p|
              li link_to("#{p.manufacturer}, #{p.model}", admin_stats_path(id: p.id))
            end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end

    end
  end # content
end
