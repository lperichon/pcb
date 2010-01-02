module CardsHelper
  def text_label(card)
    "#{t('date.month_names')[card.month_idx]} - #{Card.human_attribute_name('class_idx')} #{card.class_idx} - #{Card.human_attribute_name('question_idx')} #{card.question_idx}"
  end
end
