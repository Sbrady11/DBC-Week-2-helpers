##https://github.com/nyc-nighthawks-2017/active-record-associations-drill-at-the-races-challenge
example of associations gone right!

``belongs_to :Parent_ID``
  Denotes that the class has ONE parent, as opposed to one to many relationships

``has_many :thingsthattheyhave_ID``
  Been using this one a lot

`has_many :x, through: :x.y`
  Often used to set up a many to many connection with another model. 
  the association indicates that the decalring model can be matched with 
  zero or more instances of another model by proceeding through a third model. 
  For example, consider a medical practice where the patients made appointments 
  to see physicians. the relevant association delcarations could look like this:

  `class Physicians < applicationRecord`
    `has_many :appointments`
    `has_many :paitents, through: :appointments`
  `end`

  `class Appointment < ApplicationRecord`
    `belongs_to :patient`
    `belongs_to :physician`
  `end`

  `class Partient < ApplicationRecord`
    `has_many :appointments`
    `has_many :physicians, through: :appointments`
  `end`

`has_many :x, through: :x.y, :source :z`
  Used when you want to specify an association that isnt quite 
  listed, almost like defining a new namespace

Validations
  presence
  uniquness