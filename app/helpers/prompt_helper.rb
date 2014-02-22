module PromptHelper

  # generates proper inputs for the type of prompt
  def prompt_input_factory(form, typeof, replies, suggested_answers = false)
    'hi'

    # if type_of == 'text' do
    #   html = form.text_field
    # elsif suggested_answers
    #     html += '<div class="row">'
    #     suggested_answers.each do |a|
    #       html += '<div class="col-xs-12 col-sm-4 form-group">'
    #         %label
    #           %input{ :type => 'radio', :name => 'suggested_answer', :value => a }
    #           =a
    #     .col-xs-12.col-sm-4.form-group
    #       %input.form-control{ :name => 'suggested_answer', :placeholder => 'Name your own' }
  end

end
