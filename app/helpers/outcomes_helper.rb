module OutcomesHelper
  # ====================================================================
  # Public Functions
  # ====================================================================

  def demerit_class(achievement, allocation)
    achievement < allocation ? 'demerit' : ''
  end

  def lesson_menu_items(course, current_lesson)
    staff = course.staff? session[:id]
    if staff
      menu_items = course.lessons.map { |l| [l.display_order.to_s + '. ' + l.content.title, l.id] }
    else
      menu_items = Lesson.select_open(course.lessons).map { |l| [l.display_order.to_s + '. ' + l.content.title, l.id] }
    end

    menu_items.each do |mi|
      mi[0] = mi[1] == current_lesson.id ? '***** ' + t('helpers.current_lesson') + ' *****' : mi[0]
    end
    label = [t('helpers.messages_in_other_lesson'), -1]
    menu_items.unshift(label)
  end

  def outcome_message_text(evaluator_id)
    case evaluator_id
    when 0
      ' comment'
    else
      ' message'
    end
  end

  def outcome_score_text(evaluator_id, score)
    case evaluator_id
    when 0
      'Goal achievement rate ' + (score * 10).to_s + '%'
    else
      'score ' + score.to_s + 'point/s'
    end
  end

  def outcome_status_text(outcome_status, score)
    case outcome_status
    when 'draft'
      return t('activerecord.others.outcome.status.fix') if score && score > 0
      t('activerecord.others.outcome.status.draft')
    when 'submit', 'self_submit', 'return'
      t('activerecord.others.outcome.status.' + outcome_status)
    end
  end

  def outcome_submit_text(evaluator_id, role)
    case role
    when 'learner'
      case evaluator_id
      when 0
        'Save self evaluation'
      else
        'Submit assignment'
      end
    when 'evaluator'
      case evaluator_id
      when 0
        'Send message'
      else
        'Confirm evaluation'
      end
    when 'manager'
      'Send message'
    end
  end

  def show_outcome_form?(lesson_role, outcome_status)
    case lesson_role
    when 'observer'
      return true
    when 'learner'
      return true if outcome_status == 'draft'
      # return true if (outcome_status == 'draft') or (outcome_status == 'return')
    end
    false
  end
end
