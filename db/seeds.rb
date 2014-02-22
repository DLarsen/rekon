# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

lawyer_flow = Flow.create(title:"Lawyer")
project1 = Project.create(name:"Teri's English website", flow: lawyer_flow)

team_section = Section.create({flow:lawyer_flow, title: 'Team', slug: 'bkgrnd'})
Prompt.create(section: team_section, slug: 'a', instructions: "How many employees are on your team?")
Prompt.create(section: team_section, slug: 'b', instructions: "Who is the most important person in the company?",
  suggested_answers: ["CEO", "Janitor", "The Customer", "David", "Jon", "Nic"]
  )

social_prooof_section = Section.create({flow:lawyer_flow, title: 'Social Proof', slug: 'social-proof'})
Prompt.create(section: social_prooof_section, slug: 'c', instructions: "What's the nicest thing a client has ever said about your service?",)
Prompt.create(section: social_prooof_section, slug: 'd', instructions: "Approximately how frequently do you recieve referrals?")

objections_section = Section.create({flow:lawyer_flow, title: 'Client Objections', slug: 'objections'})
prompt1 = Prompt.create(section: objections_section, slug: 'e', instructions: "If a prospect says, \"It's too expensive?\" what would you say?")
prompt2 = Prompt.create(section: objections_section, slug: 'f', instructions: "If a prospect says, \"It's too complicated?\" what would you say?")
Reply.create(prompt:prompt1, answer: "OK", complete?: true, project: project1)
Reply.create(prompt:prompt2, answer: "OK", complete?: false, project: project1)

SectionStatus.create(project: project1, section: social_prooof_section, status_code: SectionStatus::EMPTY)
SectionStatus.create(project: project1, section: objections_section, status_code: SectionStatus::INCOMPLETE)
SectionStatus.create(project: project1, section: team_section, status_code: SectionStatus::COMPLETE)

s1 = Section.create({flow:lawyer_flow, title: 'Level 1', slug: 'l1'})
s2 = Section.create({flow:lawyer_flow, title: 'Level 2', slug: 'l1'})
s2a = Section.create({flow:lawyer_flow, title: 'Level 2a', slug: 'l1', parent: s2})
s2b = Section.create({flow:lawyer_flow, title: 'Level 2b', slug: 'l1', parent: s2})


grocer_flow = Flow.create(title:"Grocery Store")
project2 = Project.create(name:"Teri's Spanish website", flow: grocer_flow)

team_section = Section.create({flow:grocer_flow, title: 'Grocery Team', slug: 'bkgrnd'})
Prompt.create(section: team_section, slug: 'a', instructions: "How many employees are on your team?")
Prompt.create(section: team_section, slug: 'b', instructions: "Who is the most important person in the company?",
  suggested_answers: ["CEO", "Janitor", "The Customer", "David", "Jon", "Nic"]
  )

social_prooof_section = Section.create({flow:grocer_flow, title: 'Grocer Cervices', slug: 'social-proof'})
Prompt.create(section: social_prooof_section, slug: 'c', instructions: "What's the nicest thing a client has ever said about your service?",)
Prompt.create(section: social_prooof_section, slug: 'd', instructions: "Approximately how frequently do you recieve referrals?")

objections_section = Section.create({flow:grocer_flow, title: 'Shopping Tips', slug: 'objections'})
Prompt.create(section: objections_section, slug: 'e', instructions: "If a prospect says, \"It's too expensive?\" what would you say?")
Prompt.create(section: objections_section, slug: 'f', instructions: "If a prospect says, \"It's too complicated?\" what would you say?")