module PromptHelper

  # generates proper inputs for the type of prompt
  def prompt_input_factory(form, type_of, answer, suggested_answers = false, hint = false, allow_other = false)
    html = '<div class="row">'

    if type_of == 'radio' || type_of == 'checkbox'
      html << prompt_radio_input(form, type_of == 'radio', answer, suggested_answers, allow_other)
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
    form.text_field :answer, :class => 'form-control input-lg', :placeholder => hint
  end

  # generates prompt textarea
  def prompt_textarea(form, answer, hint)
    form.text_area :answer, :class => 'form-control', :placeholder => hint
  end

  # generates radio inputs
  def prompt_radio_input(form, is_radio, answer, suggested_answers, allow_other)
    html = ''
    has_answered = false

    suggested_answers.each_with_index do |suggestion, i|
      id = 'prompt_replies_answer_' + i.to_s
      checked = false
      if is_prompt_item_checked(true, answer, suggestion)
        has_answered = true
        checked = true
      elsif is_prompt_item_checked(false, answer, i)
        checked = true
      end

      html << '<div class="col-xs-12">'
      html << "<div class=\"prompt-radio radio\" title=\"#{suggestion}\">"
      html += render_prompt_item(form, is_radio, checked, id, is_radio ? suggestion : i)
      html << ' '
      html += form.label :answer, suggestion, :for => id

      html << '</div></div>'
    end

    if is_radio and allow_other
      html << '<div class="col-xs-12 col-sm-12 form-group">'
        html += form.text_field :answer_other, :class => 'form-control prompt-radio-other', :placeholder => 'Other',
          :value => has_answered ? '' : answer
      html << '</div>'
    end

    html
  end

  # renders individual radio/check boxes
  def render_prompt_item(form, is_radio, checked, id, value)
    html = ''
    if is_radio
      html += form.radio_button :answer, value, :id => id,
        :class => 'prompt-radio-input', :checked => checked
    else
      form.fields_for :answer, :index do |checkbox_form|
        html += checkbox_form.check_box value, :id => id,
          :class => 'prompt-radio-input', :checked => checked
      end
    end
    html.html_safe
  end

  # confirms whether or not radio/checkbox is checked by the value
  def is_prompt_item_checked(is_radio, answer, comparison = false)
    if is_radio && answer == comparison
      true
    elsif !is_radio && answer && answer.split('|')[comparison.to_i] == '1'
      true
    else
      false
    end
  end

end
