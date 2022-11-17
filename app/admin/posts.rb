ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :post_type, :duration, :category_id, :video, :image, :disable
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :type, :duration, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
 
  config.sort_order = "count_asc"
  config.per_page = 2

  filter :category
  filter :post_type
  filter :duration
  form do |f|
    f.inputs do 
      f.input :category,:prompt => 'Select Category' ,:as => :select, collection:()  
      f.input :post_type, :prompt => 'Select Post type' 
      f.input :disable 
      f.input :name
      f.input :duration, :as => :time_picker
      f.input :description, :input_html=> { :rows => 3 } 
      f.input :video, as: :file, hint: f.object.video.present? ?         
      (video_tag url_for(f.object.video), size: "180x100", :controls => true   if f.object.video.attached?) : ''

      f.input :image, as: :file, hint: f.object.image.present? ? 
        (image_tag url_for(f.object.image), size: "180x100", :controls => true   if f.object.image.attached?) : '' 
      f.actions
    end
  end

    index do
      selectable_column
      id_column
      column :category
      column :name  
      column :description
      column :post_type
      column :duration
      column :created_at
      column :updated_at
      column :disable
      column "likes count", :count
      actions  
    end
    
    scope :all
    scope :Video, :default => true do | post_video|
      post_video.where(:post_type => 'video')
    end

    scope :Audio, :default => true do |post_audio|
      post_audio.where(:post_type => 'audio')
    end
  
  show do
    attributes_table do
      row :name
      row :description
      row :post_type
      row :duration
      row :created_at
      row :updated_at
      row :disable 
      row "likes count", :count
      row :image do |ad|
        image_tag url_for(ad.image), size: "200x100", :controls => true   if ad.image.attached?
      end
      row :video do |ad|
        video_tag url_for(ad.video), size: "200x100", :controls => true   if ad.video.attached?
      end
    end
  end

    batch_action :disable do |ids|
       batch_action_collection.find(ids).each do |post|
        post.update(disable: true)
      end
          redirect_to collection_path, alert: "The posts have been Disable"
    end

    batch_action :Enable do |ids|
       batch_action_collection.find(ids).each do |post|
        post.update(disable: false)
      end
       redirect_to collection_path, alert: "The posts have been Enable"
    end

end
