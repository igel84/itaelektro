RailsAdmin.config do |config|

  config.yell_for_non_accessible_fields = false
  config.authorize_with :cancan
  config.main_app_name = ['Itaelektro', 'Admin']
  config.current_user_method { current_user } # auto-generated
  config.audit_with :history, 'User'
  config.default_items_per_page = 50
  config.excluded_models = ['Role', 'RoleUser', 'GritterNotice', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture']

#  config.included_models = ['Article', 'User']

  [:email].each{ |attr| config.label_methods << attr }

  config.model 'Article' do
      configure :id, :integer
      configure :to_main_block, :boolean
      configure :name, :string      
      configure :title, :string
      configure :body, :text
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :title        
      end
      show do; end
      edit do
        field :to_main_block
        field :name
        field :title
        field :body do
          ckeditor do 
            true
          end
        end        
      end
      export do; end
  end

  config.model 'CatalogueSection' do
      configure :products, :has_many_association
      configure :id, :integer 
      configure :name, :string
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :name        
      end
      show do; end
      edit do
        field :name        
        field :products
      end
      export do; end
  end
  
  config.model 'Product' do    
    configure :product_images, :has_many_association
    configure :top_product_attributes, :enum
    configure :bottom_product_attributes, :enum
    configure :catalogue_section, :belongs_to_association
    configure :id, :integer     
    configure :title, :string
    configure :name, :string
    configure :brand, :string
    configure :kod, :string
    configure :price, :decimal
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name      
      field :catalogue_section
      field :product_images
    end
    show do; end
    edit do
      field :catalogue_section
      field :title do
        length do
          255
        end
      end
      field :brand do
        length do
          255
        end
      end
      field :name do
        length do
          255
        end
      end
      field :kod do
        length do
          255
        end
      end
      field :price
      field :product_images
      field :top_product_attributes      
      field :bottom_product_attributes      
    end
    export do; end
  end

  config.model 'ProductImage' do
      configure :product, :belongs_to_association
      configure :id, :integer 
      configure :image, :carrierwave
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :image
        field :product
      end
      show do; end
      edit do
        field :product do
          hide
        end
        field :image
      end
      export do; end
  end

  config.model 'ProductAttribute' do    
    configure :id, :integer 
    configure :name, :string
    configure :value, :string
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name
      field :value      
    end
    show do; end
    edit do
      field :name do
        length do
          255
        end
      end
      field :value      
    end
    export do; end
  end

  config.model 'MenuItem' do
    configure :id, :integer 
    configure :parent, :belongs_to_association
    configure :children, :has_many_association
    configure :lft, :integer
    configure :rgt, :integer
    configure :depth, :integer
    configure :name, :string
    configure :url, :string
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name
      field :url      
      field :parent
    end
    show do; end
    edit do
      field :parent
      field :name do
        length do
          255
        end
      end
      field :name
      field :url      
    end
    export do; end
  end

  config.model 'Banner' do
      configure :id, :integer 
      configure :alt, :string
      configure :file_url, :string 
      configure :image, :carrierwave
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :alt
        field :image
      end
      show do; end
      edit do        
        field :alt        
        field :file_url
        field :image
      end
      export do; end
  end

end
