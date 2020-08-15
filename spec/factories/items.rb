FactoryBot.define do
  factory :item do
    # id                        {1}
    image                      { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'image/jpeg') }
    product_name              {Faker::Name.name}
    info                      {"説明しよう！"}
    category_id               {3}
    sales_status_id           {2}
    shipping_fee_id           {2}
    prefecture_id             {2}
    scheduled_delivery_id     {2}
    price                     {3000}
    user_id                   {2}
    

    

  end
end