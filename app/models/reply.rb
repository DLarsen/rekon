class Reply

  # We will replace this with an association
  attr_accessible :prompt

  attr_accessible :text

  #These might be response types instead
  attr_accessible :skipped?
  attr_accessible :not_applicable?

  #meta
  #author, date, etc

end