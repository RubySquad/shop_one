ActiveAdmin.register Product do

  menu label: "Товары", priority: 2

  permit_params :name, :price, :count, :image, :category_id, :producer_id, :retailer_id

  index :title => 'Товары' do
    selectable_column
    column "Наименование",        :name
    column "Категория",           :category
    column "Производитель",       :producer
    column "Магазин",             :retailer
    column "Цена",                :price
    column "Изображение",         :image_file_name
    column "Кол-во в наличии",    :count
    column "Последнее изменение", :updated_at
    actions
  end



  form do |f|
    inputs "Свойства товара" do
      f.input :name,  label: "Наименование"
      f.input :category,  label: "Категория"
      f.input :producer,  label: "Производитель"
      f.input :retailer,  label: "Магазин"
      f.input :price, label: "Цена"
      f.input :count, label: "Кол-во в наличии"
      f.file_field :image
    end
    actions
  end


end
