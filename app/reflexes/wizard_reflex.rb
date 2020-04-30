# frozen_string_literal: true

class WizardReflex < ApplicationReflex
  STEPS = [:title, :body, :submit]

  def next(values)
    @post = Post.persistent(session.id, values)
    @step = STEPS[STEPS.find_index(read_step) + 1]

    write_step @step
  end

  def previous(values)
    @post = Post.persistent(session.id, values)
    @step = STEPS[STEPS.find_index(read_step) - 1]

    write_step @step
  end

  protected

  def read_step
    Rails.cache.read("step:#{session.id}")
  end

  def write_step(step)
    Rails.cache.write("step:#{session.id}", step)
  end
end
