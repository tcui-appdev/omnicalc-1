class ApplicationController < ActionController::Base
  def blank_square_form
    self.render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num * @num
    self.render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_sqrt_form
    self.render({ :template => "calculation_templates/sqrt_form.html.erb" })
  end

  def calculate_sqrt
    @num = params.fetch("user_number").to_f
    @sqrt_of_num = Math.sqrt(@num)
    self.render({ :template => "calculation_templates/sqrt_results.html.erb" })
  end

  def blank_payment_form
    self.render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f
    r = (@apr / 100) / 12
    n = @years * 12
    @payment = (@principal * (r * ((1 + r) ** n))) / (((1 + r) ** n) - 1)
    self.render({ :template => "calculation_templates/payment_results.html.erb" })
  end

  def blank_random_form
    self.render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    self.render({ :template => "calculation_templates/rand_results.html.erb" })
  end
end
