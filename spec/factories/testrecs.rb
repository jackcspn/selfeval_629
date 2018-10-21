FactoryGirl.define do
  factory :testrecs do |f|
    f.userid "0"
    f.correctness "{'1'=>'wrong', '2'=>'wrong', '3'=>'correct', '4'=>'wrong'}"
    f.mark "{'1'=>'marked', '2'=>'answered', '3'=>'answered', '4'=>'marked'}"
    f.notice "Last saved test loaded."
    f.answers "{'1'=>'option1', '2'=>'option1', '3'=>'option1', '4'=>'option1'}"
    f.seltopics "{'606_course'=>'selected', 'Math'=>'selected', 'general'=>'selected'}"
    f.answers "{'1'=>'option1', '2'=>'option1', '3'=>'option1', '4'=>'option1'}"
    f.alltopics "{}"
  end
end