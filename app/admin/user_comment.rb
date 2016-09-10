ActiveAdmin.register UserComment do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :body, :score

  index do
    selectable_column
    id_column
    column :body
    column :score
    column :user
    column :photo
    actions
  end

  show do
    attributes_table do
      row :id
      row :body
      row :user
      row :photo
      row :photo do |photo|
       image_tag photo.photo.image.url(:thumb)
      end
      row :score
    end
    active_admin_comments
  end

end
