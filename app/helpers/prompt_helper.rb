module PromptHelper

  # generates proper inputs for the type of prompt
  def prompt_input_factory(form, type_of, replies, suggested_answers = false)
    html = '<div class="row">'
    if type_of == 'text'
      html += '<div class="form-group col-xs-12">'
      form.fields_for :replies do |builder|
        html += builder.text_field :answer, :class => 'form-control',
          :placeholder => suggested_answers
      end
      html += '</div>'
    elsif suggested_answers
      # suggested_answers.each do |a|
      #   html += '<div class="col-xs-12 col-sm-4 form-group">'
      #     %label
      #       %input{ :type => 'radio', :name => 'suggested_answer', :value => a }
      #       =a
      # .col-xs-12.col-sm-4.form-group
      #   %input.form-control{ :name => 'suggested_answer', :placeholder => 'Name your own' }
    end
    html += '</div>'
  end

end
