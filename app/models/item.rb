class Item < ApplicationRecord
   validates_presence_of :title, :work_time
end
