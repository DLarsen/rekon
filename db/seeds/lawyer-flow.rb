
flow = Flow.create(title:"Lawyer")
project = Project.create(name:"Brooks & Burch", flow: flow)

section_audience          = Section.create({flow:flow, level: 1, sequence: 1, title: 'Audience', slug: 'audience'})
section_audience_overview = Section.create({flow:flow, level: 2, sequence: 1, parent: section_audience, title: 'Overview', slug: 'audience-overview'})
section_audience_existing = Section.create({flow:flow, level: 2, sequence: 2, parent: section_audience, title: 'Existing Clients', slug: 'existing-clients'})
section_audience_non      = Section.create({flow:flow, level: 2, sequence: 3, parent: section_audience, title: 'Non-Clients', slug: 'non-clients'})

# AUDIENCE
p1 = Prompt.create(
  sequence: 2,
  section: section_audience_overview,
  slug: 'audience-priority',
  instructions: "Who are your most important website visitors?",
  details: "<b>Example:</b> Yes, we're forcing you to pick one.  They can't ALL be the most important.",
  type_of: 'radio',
  suggested_answers: ["Existing Clients", "Warm Leads", "Cold Leads"]
)

p2 = Prompt.create(
  sequence: 1,
  section: section_audience_existing,
  slug: 'existing-reasons',
  instructions: "Why would an existing client visit your website?",
  details: "What value can be gained from visiting you site?",
  type_of: 'checkbox',
  suggested_answers: [
    "Find street address",
    "Find email",
    "Find other information",
    "Submit information"
  ]
)

Prompt.create(
  sequence: 4,
  section: section_audience_existing,
  slug: 'non-reasons',
  instructions: "How often would you expect existing clients to use your website?",
  type_of: 'text',
  hint: 'e.g. "3 times a week" or "Once a month"'
)

Prompt.create(
  sequence: 3,
  section: section_audience_existing,
  slug: 'non-reasons',
  instructions: "Describe your company history in a way that existing clients would appreciate.",
  details: 'Tell us about how you have solved client\'s problems in the past or possibly how you overcame a trial to found your company.',
  type_of: 'textarea'
)

p3 = Prompt.create(
  sequence: 5,
  section: section_audience_non,
  slug: 'non-reasons',
  instructions: "What do you expect to typically occur first for someone who is NOT a client?",
  details: "First interaction...",
  type_of: 'radio',
  suggested_answers: [
    "Visited website",
    "Spoke with someone at your firm",
    "Hard to say"
  ]
)

p4 = Prompt.create(
  sequence: 6,
  section: section_audience_non,
  slug: 'non-reasons',
  instructions: "Why would someone who is NOT a client visit your website?",
  details: "The reasons might be the same as your existing clients, but they <i>might</i> be different.",
  type_of: 'checkbox',
  suggested_answers: [
    "Learn more about your area of expertise",
    "Find email",
    "Find other information",
    "Submit information"
  ]
)


section_cheeks          = Section.create({flow:flow, level: 1, sequence: 2, title: 'Audience', slug: 'audience'})
section_audience_overview = Section.create({flow:flow, level: 2, sequence: 1, parent: section_cheeks, title: 'Overview', slug: 'audience-overview'})
section_audience_existing = Section.create({flow:flow, level: 2, sequence: 2, parent: section_cheeks, title: 'Existing Clients', slug: 'existing-clients'})
section_audience_non      = Section.create({flow:flow, level: 2, sequence: 3, parent: section_cheeks, title: 'Non-Clients', slug: 'non-clients'})

# section_expertise = Section.create({flow:flow, level: 1, sequence: 2, title: 'Expertise', slug: 'expertise'})
# section_services  = Section.create({flow:flow, level: 1, sequence: 3, title: 'Services', slug: 'services'})
# section_contact   = Section.create({flow:flow, level: 1, sequence: 4, title: 'Contact', slug: 'contact'})
# section_about     = Section.create({flow:flow, level: 1, sequence: 5, title: 'About', slug: 'about'})
# section_team      = Section.create({flow:flow, level: 1, sequence: 6, title: 'Team', slug: 'team'})

# AUDIENCE
p1 = Prompt.create(
  sequence: 2,
  section: section_audience_overview,
  slug: 'audience-priority',
  instructions: "Who are your most important website visitors?",
  details: "<b>Example:</b> Yes, we're forcing you to pick one.  They can't ALL be the most important.",
  type_of: 'radio',
  suggested_answers: ["Existing Clients", "Warm Leads", "Cold Leads"]
)

p2 = Prompt.create(
  sequence: 1,
  section: section_audience_existing,
  slug: 'existing-reasons',
  instructions: "Why would an existing client visit your website?",
  details: "What value can be gained from visiting you site?",
  type_of: 'checkbox',
  suggested_answers: [
    "Find street address",
    "Find email",
    "Find other information",
    "Submit information"
  ]
)

Prompt.create(
  sequence: 4,
  section: section_audience_existing,
  slug: 'non-reasons',
  instructions: "How often would you expect existing clients to use your website?",
  type_of: 'text'
)

Prompt.create(
  sequence: 3,
  section: section_audience_existing,
  slug: 'non-reasons',
  instructions: "Describe your company history in a way that existing clients would appreciate.",
  type_of: 'textarea'
)

p3 = Prompt.create(
  sequence: 5,
  section: section_audience_non,
  slug: 'non-reasons',
  instructions: "What do you expect to typically occur first for someone who is NOT a client?",
  details: "First interaction...",
  type_of: 'radio',
  suggested_answers: [
    "Visited website",
    "Spoke with someone at your firm",
    "Hard to say"
  ]
)


Reply.create(prompt:p1, answer: "Somewhat Important", complete: true, project: project)

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

# s1 = Section.create({flow:flow, title: 'Level 1', slug: 'l1'})
# s2 = Section.create({flow:flow, title: 'Level 2', slug: 'l1'})
# s2a = Section.create({flow:flow, title: 'Level 2a', slug: 'l1', parent: s2})
# s2b = Section.create({flow:flow, title: 'Level 2b', slug: 'l1', parent: s2})