
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
s_mission    = Section.create({flow:flow, level: 2, sequence: 1, parent: s_services, title: 'Description'})
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
  instructions: "Do you have a domian for your website?",
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
  details: "<b>Exapmle:</b> www.contoso.com",
  type_of: 'text'
)


p1 = Prompt.create(
  sequence: 2,
  section: s_name,
  instructions: "What is your official company name?",
  type_of: 'text'
)

p1 = Prompt.create(
  sequence: 2,
  section: s_name,
  instructions: "Are you sure?",
  type_of: 'text',
  type_of: 'radio',
  suggested_answers: [
    "Yes",
    "No"
  ],
  allow_other: false
)