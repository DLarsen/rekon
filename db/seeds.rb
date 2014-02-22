# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



flow = Flow.create(title:"Lawyer")

project = Project.create(name:"Teri's website", flow: flow)

no_flow = Flow.create(title:"YOU SHOULD NOT SEE THIS")
no_section = Section.create({flow:no_flow, title: 'YOU SHOULD NOT SEE THIS', slug: 'no-bueno'})

team_section = Section.create({flow:flow, title: 'Team', slug: 'bkgrnd'})
Prompt.create(section: team_section, slug: 'a', instructions: "How many employees are on your team?")
Prompt.create(section: team_section, slug: 'b', instructions: "Who is the most important person in the company?",
  suggested_answers: ["CEO", "Janitor", "The Customer", "David", "Jon", "Nic"]
  )


social_prooof_section = Section.create({flow:flow, title: 'Social Proof', slug: 'social-proof'})
Prompt.create(section: social_prooof_section, slug: 'c', instructions: "What's the nicest thing a client has ever said about your service?",)
Prompt.create(section: social_prooof_section, slug: 'd', instructions: "Approximately how frequently do you recieve referrals?")

objections_section = Section.create({flow:flow, title: 'Client Objections', slug: 'objections'})
Prompt.create(section: objections_section, slug: 'e', instructions: "If a prospect says, \"It's too expensive?\" what would you say?")
Prompt.create(section: objections_section, slug: 'f', instructions: "If a prospect says, \"It's too complicated?\" what would you say?")