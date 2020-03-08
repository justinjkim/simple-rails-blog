class Comment < ApplicationRecord
  belongs_to :post # this was created by "post:references" in the generate command line
end
