class ContributorSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :employee_amount,
             :direct_amount,
             :total_amount
end
