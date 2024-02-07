class Note < ApplicationRecord
  # when you log in you can only see your notes(user which is a model:references)
  belongs_to :user
end
