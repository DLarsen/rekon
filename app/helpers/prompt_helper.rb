module PromptHelper

  # generates proper inputs for the type of prompt
  def prompt_input_factory(form, type_of, answer, suggested_answers = false, hint = false)
    html = '<div class="row">'

    if type_of == 'radio'
      html << prompt_radio_input(form, answer, suggested_answers)
    else
      html += '<div class="form-group col-xs-12">'
      if type_of == 'textarea'
        html += prompt_textarea(form, answer, hint)
      else
        html += prompt_text(form, answer, hint)
      end
      html += '</div>'
    end

    html << '</div>'
  end

  # genrates normal text prompt
  def prompt_text(form, answer, hint)
    form.text_field :answer, :class => 'form-control', :placeholder => hint
  end

  # generates prompt textarea
  def prompt_textarea(form, answer, hint)
    form.text_area :answer, :class => 'form-control', :placeholder => hint
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
      html << '<div class="prompt-radio radio">'
      html += form.radio_button :answer, suggestion, :id => id,
        :class => 'prompt-radio-input', :checked => checked
      html += ' '
      html += form.label :answer, suggestion, :for => id

      html << '</div></div>'
    end
    html += '<div class="col-xs-12 col-sm-4 form-group">'
    html += form.text_field :answer_other, :class => 'form-control prompt-radio-other', :placeholder => 'Other',
      :value => has_answered ? '' : answer
    html << '</div>'
  end

end
