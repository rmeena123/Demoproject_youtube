ActiveAdmin.register User do
  
 actions :all, :except => [:edit, :destroy]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :password_confirmation, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
 

  
   form do |f|
    f.inputs do 
    f.input :email 
    f.input :password
    f.input :password_confirmation
   f.actions
    end
  end



  index do
    selectable_column
    id_column
    column  :email 
    column :created_at
    column :updated_at
    actions  
  end

   show do
    attributes_table do
      row :email
      row :created_at
      row :updated_at

      if user.playlists.present?
      panel "Playlist" do
        attributes_table_for user.playlists do
          row :name do 
            "playlist"
          end
          row :post_name do |p|
            p.post&.name

          end
          row :description do |p|
            p.post&.description
          end
           row :duration do |p|
            p.post&.duration
           end
           
           row :post_type do |p|
            p.post&.post_type
           end
          row :image do |ad|
           image_tag url_for(ad.post&.image), size: "200x100", :controls => true   if ad.post&.image&.attached?
          end
        end

      end
    end
   end
  end

end
