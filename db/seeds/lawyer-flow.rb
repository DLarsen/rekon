
flow = Flow.create(title:"Lawyer")
project = Project.create(name:"Brooks & Burch", flow: flow)

section_expertise = Section.create({flow:flow, title: 'Expertise', slug: 'expertise'})
section_services  = Section.create({flow:flow, title: 'Services', slug: 'services'})
section_contact   = Section.create({flow:flow, title: 'Contact', slug: 'contact'})
section_about     = Section.create({flow:flow, title: 'About', slug: 'about'})
section_team      = Section.create({flow:flow, title: 'Team', slug: 'team'})

p1 = Prompt.create(
  section: section_expertise,
  slug: 'education-care',
  instructions: "How much do website visitors care about your education?",
  details: "How much do website visitors care about your education?",
  type_of: 'radio',
  suggested_answers: ["Not Important", "Somewhat Important", "Very Important"]
)

Reply.create(prompt:p1, answer: "OK", complete: true, project: project)
#Reply.create(prompt:prompt2, answer: "OK", complete: false, project: project)

# Prompt.create(
#   section: team_section,
#   slug: 'a',
#   instructions: "How many employees are on your team?",
#   suggested_answers: '12'
# )
# Prompt.create(
#   section: team_section,
#   slug: 'b',
#   instructions: "Who is the most important person in the company?",
#   type_of: 'radio',
#   suggested_answers: ["CEO", "Janitor", "The Customer", "David", "Jon", "Nic"]
# )

# social_prooof_section = Section.create({flow:flow, title: 'Social Proof', slug: 'social-proof'})
# Prompt.create(
#   section: social_prooof_section,
#   slug: 'c',
#   instructions: "What's the nicest thing a client has ever said about your service?",
#   type_of: 'text'
# )
# Prompt.create(
#   section: social_prooof_section,
#   slug: 'd',
#   instructions:
#   "Approximately how frequently do you recieve referrals?"
# )

# objections_section = Section.create({flow:flow, title: 'Client Objections', slug: 'objections'})
# prompt1 = Prompt.create(
#   section: objections_section,
#   slug: 'e',
#   instructions: "If a prospect says, \"<i>It's too expensive!</i>\" what would you say?",
#   type_of: 'textarea'
# )
# prompt2 = Prompt.create(section: objections_section, slug: 'f', instructions: "If a prospect says, \"<i>It's too complicated!</i>\" what would you say?")

# Reply.create(prompt:prompt1, answer: "OK", complete: true, project: project)
# Reply.create(prompt:prompt2, answer: "OK", complete: false, project: project)

# SectionStatus.create(project: project, section: social_prooof_section, status_code: SectionStatus::EMPTY)
# SectionStatus.create(project: project, section: objections_section, status_code: SectionStatus::INCOMPLETE)
# SectionStatus.create(project: project, section: team_section, status_code: SectionStatus::COMPLETE)

s1 = Section.create({flow:flow, title: 'Level 1', slug: 'l1'})
s2 = Section.create({flow:flow, title: 'Level 2', slug: 'l1'})
s2a = Section.create({flow:flow, title: 'Level 2a', slug: 'l1', parent: s2})
s2b = Section.create({flow:flow, title: 'Level 2b', slug: 'l1', parent: s2})