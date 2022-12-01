ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form do |f|
    f.inputs do 
      f.input :name
    end
      f.actions
  end
  index do
   selectable_column
   id_column
   column :name  
   column :created_at  
   column :updated_at 
   actions
  end
 
  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
   
  end

  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    CsvDb.convert_save("category", params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end

end
 

