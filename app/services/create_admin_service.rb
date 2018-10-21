# class CreateAdminService
#   def call
#     user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |use|
#         use.password = Rails.application.secrets.admin_password
#         use.password_confirmation = Rails.application.secrets.admin_password
#         use.admin!
#       end
#   end
# end
