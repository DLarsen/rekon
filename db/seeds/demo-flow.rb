
flow = Flow.create(title:"Basic Brochure Website")
project = Project.create(name:"Larsen, Gangloff & Larsen Website", flow: flow)

s_overview   = Section.create({flow:flow, level: 1, sequence: 1, title: 'Basics',
  description: "Before diving deep into the heart of your content, let's get a few initial questions out of the way.<br /><br />This section should only take a few minutes to complete."})
s_domain     = Section.create({flow:flow, level: 2, sequence: 1, parent: s_overview, title: 'Domain Name'})
s_name       = Section.create({flow:flow, level: 2, sequence: 2, parent: s_overview, title: 'Name'})
#s_logo       = Section.create({flow:flow, level: 2, sequence: 3, parent: s_overview, title: 'Logo'})

s_company    = Section.create({flow:flow, level: 1, sequence: 2, title: 'Company',
  description: "Before diving deep into the heart of your content, let's get a few initial questions out of the way.<br /><br />This section should only take a few minutes to complete."})
s_mission    = Section.create({flow:flow, level: 2, sequence: 1, parent: s_company, title: 'Mission'})
s_history    = Section.create({flow:flow, level: 2, sequence: 2, parent: s_company, title: 'History'})
s_team       = Section.create({flow:flow, level: 2, sequence: 3, parent: s_company, title: 'Team'})


s_services   = Section.create({flow:flow, level: 1, sequence: 3, title: 'Services',
  description: "Before diving deep into the heart of your content, let's get a few initial questions out of the way.<br /><br />This section should only take a few minutes to complete."})
s_description    = Section.create({flow:flow, level: 2, sequence: 1, parent: s_services, title: 'Description'})
s_process    = Section.create({flow:flow, level: 2, sequence: 2, parent: s_services, title: 'Process'})

# s_overview   = Section.create({flow:flow, level: 1, sequence: 4, title: 'Background'})
# s_overview   = Section.create({flow:flow, level: 1, sequence: 5, title: 'Testimonails'})

s_responses  = Section.create({flow:flow, level: 1, sequence: 6, title: 'Visitor Response', slug: 'responses',
  description: "Before diving deep into the heart of your content, let's get a few initial questions out of the way.<br /><br />This section should only take a few minutes to complete."})
s_objectives = Section.create({flow:flow, level: 2, sequence: 1, parent: s_responses, title: 'Objectives'})
s_contact_us = Section.create({flow:flow, level: 2, sequence: 2, parent: s_responses, title: 'Contact Us'})
s_newsletter = Section.create({flow:flow, level: 2, sequence: 3, parent: s_responses, title: 'Newsletter'})

p1 = Prompt.create(
  sequence: 1,
  section: s_domain,
  instructions: "Do you have a domain for your website?",
  details: "If you have already registered a domain name, select Yes.",
  type_of: 'radio',
  suggested_answers: [
    "Yes",
    "No"
  ],
  allow_other: false
)

p1 = Prompt.create(
  sequence: 2,
  section: s_domain,
  instructions: "What is your domain name?",
  details: "<b>Example:</b> www.contoso.com",
  type_of: 'text'
)


p1 = Prompt.create(
  sequence: 2,
  section: s_name,
  instructions: "What is your official company name?",
  type_of: 'text'
)

p1 = Prompt.create(
  sequence: 1,
  section: s_mission,
  instructions: "Do you have a company mission statement?",
  type_of: 'text',
  type_of: 'radio',
  suggested_answers: [
    "Yes",
    "No"
  ],
  allow_other: false
)

p1 = Prompt.create(
  sequence: 1,
  section: s_history,
  instructions: "How much do clients care about your company history?",
  details: "We're just trying to get a sense of the relative importance of this content.",
  type_of: 'text',
  type_of: 'radio',
  suggested_answers: [
    "A Lot",
    "Somewhat",
    "Not at all"
  ],
  allow_other: false
)

p1 = Prompt.create(
  sequence: 2,
  section: s_history,
  instructions: "Describe your company history.",
  details: "It's up to you to decide how much to include.  We can edit it down later as needed.",
  type_of: 'textarea'
)

p1 = Prompt.create(
  sequence: 1,
  section: s_team,
  instructions: "How much do clients care about your team?",
  details: "Is it important that web visitors get to know your team?",
  type_of: 'text',
  type_of: 'radio',
  suggested_answers: [
    "A Lot",
    "Somewhat",
    "Not at all"
  ],
  allow_other: false
)

p1 = Prompt.create(
  sequence: 2,
  section: s_team,
  instructions: "How many team members do you have?",
  details: "<b>Hint:</b> You may not want to put everyone on the website.  Just enter the number you want to include on the site.",
  type_of: 'text'
)

p1 = Prompt.create(
  sequence: 3,
  section: s_team,
  instructions: "What is the first team member's name?",
  details: "<b>Hint:</b> Use first name or full name, whatever you want to appear on the site.",
  type_of: 'text'
)

p1 = Prompt.create(
  sequence: 4,
  section: s_team,
  instructions: "Tell us about Jon:",
  details: "We're just looking for a brief bio.  Several sentences is about right.",
  type_of: 'textarea'
)

p1 = Prompt.create(
  sequence: 1,
  section: s_description,
  instructions: "What kind of services do you provide for your client?",
  details: "This might be one of the longest sections.  That's OK.",
  type_of: 'textarea'
)

p1 = Prompt.create(
  sequence: 2,
  section: s_description,
  instructions: "How are your services different from your competitors?",
  type_of: 'textarea'
)


p1 = Prompt.create(
  sequence: 1,
  section: s_process,
  instructions: "Describe the process.",
  details: "This might be one of the longest sections.  That's OK.",
  type_of: 'textarea'
)

p1 = Prompt.create(
  sequence: 2,
  section: s_process,
  instructions: "How long does it take?",
  type_of: 'text'
)

p1 = Prompt.create(
  sequence: 3,
  section: s_process,
  instructions: "How much paperwork is required?",
  type_of: 'text'
)

p1 = Prompt.create(
  sequence: 3,
  section: s_process,
  instructions: "What if you can't save a client money?  What would you tell them?",
  type_of: 'textarea'
)