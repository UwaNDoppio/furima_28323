FactoryBot.define do
  factory :shipping_address do
    post_number        {123-4567}
    prefecture_id      {3}
    city               {"ほげ"}
    address            {"ふが"}
    phone_number       {"09080007000"}
    item_id            {8}
  end
end
