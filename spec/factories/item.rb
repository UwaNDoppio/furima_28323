FactoryBot.define do
  factory :item do
    image                     {Faker::Name.initials(number: 2)}
    product_name              {Faker::Name.initials(number: 2)}
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