require 'rails_helper'
require './app/poros/protocol'
require './app/facades/protocol_facade'

RSpec.describe Protocol do
  let!(:info) {{:id=>"1",
    :type=>"protocol",
    :attributes=>
    {:name=>"Fadiman",
      :days_between_dose=>3,
      :dose_days=>nil,
      :dosage=>0.2,
      :description=>
      "This protocol ensures that a long enough break happens between doses allowing for the contrast between the normal days and microdosing days to become apparent. This is deeply important in terms of understanding the benefits of microdosing in your life. The first day after microdosing is what some call the ‘afterglow’ day. A time when the residue from the previous dosage of psilocybin still lingers. The second day after microdosing is what we call a ‘normal’ day. This is when your system is restored to your unique level of homeostasis.",
      :protocol_duration=>4,
      :break_duration=>3,
      :other_notes=>"Taken in the morning"}
    }}
  let!(:protocol) {Protocol.new(info)}

  it 'exists' do
    expect(protocol).to be_a(Protocol)
  end

  it 'has attributes' do
    expect(protocol.id).to eq("1")
    expect(protocol.name).to eq("Fadiman")
    expect(protocol.description).to eq("This protocol ensures that a long enough break happens between doses allowing for the contrast between the normal days and microdosing days to become apparent. This is deeply important in terms of understanding the benefits of microdosing in your life. The first day after microdosing is what some call the ‘afterglow’ day. A time when the residue from the previous dosage of psilocybin still lingers. The second day after microdosing is what we call a ‘normal’ day. This is when your system is restored to your unique level of homeostasis.")
    expect(protocol.dose_days).to eq(nil)
    expect(protocol.days_between_dose).to eq(3)
    expect(protocol.dosage).to eq(0.2)
    expect(protocol.protocol_duration).to eq(4)
    expect(protocol.break_duration).to eq(3)
    expect(protocol.other_notes).to eq("Taken in the morning")
  end
end