module PromptHelper

  # generates proper inputs for the type of prompt
  def prompt_input_factory(form, type_of, answer, suggested_answers = false)
    html = '<div class="row">'
    if type_of == 'text'
      html += '<div class="form-group col-xs-12">'
      form.fields_for :replies do |reply_form|
        html += reply_form.text_field :answer, :class => 'form-control',
          :placeholder => suggested_answers
      end
      html += '</div>'
    elsif type_of == 'radio'
      form.fields_for :replies do |reply_form|
        html << prompt_radio_input(reply_form, answer, suggested_answers)
      end
    end
    html << '</div>'
  end

  # generates radio inputs
  def prompt_radio_input(form, answer, suggested_answers)
    html = ''
    has_answered = false

    suggested_answers.each_with_index do |suggestion, i|
      id = 'prompt_replies_answer_' + i.to_s
      checked = false
      if answer == suggestion
        has_answered = true
        checked = true
      end

      html << '<div class="col-xs-12 col-sm-4 form-group">'
      html += form.radio_button :answer, suggestion, :id => id, :checked => checked
      html += ' '
      html += form.label :answer, suggestion, :for => id

      html << '</div>'
    end
    html += '<div class="col-xs-12 col-sm-4 form-group">'
    html += form.text_field :answer, :class => 'form-control', :placeholder => 'Other',
      :value => has_answered ? '' : answer
    html << '</div>'
  end

end
