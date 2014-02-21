class Section

..attr_accessible :flow
  #use if we want to nest sections (which scares me for some reason)
  attr_accessible :section

  # 0 is first, million is last
  attr_accessible :sequence

  attr_accessible :title
..attr_accessible :slug

end