# frozen_string_literal: true

class WizardReflex < ApplicationReflex
  STEPS = [:title, :body, :submit]

  def next(values)
    @post = Post.persistant(session.id, values)

    current_step = read_step
    @step = STEPS[STEPS.find_index(current_step) + 1]
    write_step @step
  end

  def previous(values)
    @post = Post.persistant(session.id, values)

    current_step = read_step
    @step = STEPS[STEPS.find_index(current_step) - 1]
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
