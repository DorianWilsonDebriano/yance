ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        columns class: "dashboard-colums" do
          column class: "dashboard-column" do
            panel "Current Users" do
              ul do
                User.limit(20).map do |user|
                  li link_to(user.first_name, admin_user_path(user))
                end
              end
            end
            columns class: "dashboard-colums" do
              column class: "dashboard-column" do
                panel "Current Trainers" do
                  ul do
                    Trainer.limit(20).map do |trainer|
                      li link_to(trainer.user.email, admin_trainers_path(trainer))
                    end
                  end
                end
              end
            end
            columns class: "dashboard-colums" do
              column class: "dashboard-column" do
                panel "Current Classes" do
                  ul do
                    SportsClass.limit(20).map do |sports_class|
                      li link_to(sports_class.title, admin_sports_class_path(sports_class))
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    # column do
    #   panel "Current Users" do
    #     ul do
    #       User.limit(100).map do |user|
    #         li link_to(user.email, admin_user_path(user))
    #       end
    #     end
    #   end
    # end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
      # end
  #   end # content
  # end
