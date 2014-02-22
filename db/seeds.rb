# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require File.expand_path('../seeds/lawyer-flow.rb', __FILE__)



# grocer_flow = Flow.create(title:"Grocery Store")
# project2 = Project.create(name:"Teri's Spanish website", flow: grocer_flow)

# team_section = Section.create({flow:grocer_flow, title: 'Grocery Team', slug: 'bkgrnd'})
# Prompt.create(section: team_section, slug: 'a', instructions: "How many employees are on your team?")
# Prompt.create(section: team_section, slug: 'b', instructions: "Who is the most important person in the company?",
#   suggested_answers: ["CEO", "Janitor", "The Customer", "David", "Jon", "Nic"]
#   )

# social_prooof_section = Section.create({flow:grocer_flow, title: 'Grocer Cervices', slug: 'social-proof'})
# Prompt.create(section: social_prooof_section, slug: 'c', instructions: "What's the nicest thing a client has ever said about your service?",)
# Prompt.create(section: social_prooof_section, slug: 'd', instructions: "Approximately how frequently do you recieve referrals?")

# objections_section = Section.create({flow:grocer_flow, title: 'Shopping Tips', slug: 'objections'})
# Prompt.create(section: objections_section, slug: 'e', instructions: "If a prospect says, \"It's too expensive?\" what would you say?")
# Prompt.create(section: objections_section, slug: 'f', instructions: "If a prospect says, \"It's too complicated?\" what would you say?")