require_relative "../../spec_helper"
require_relative "theme_spec_helper"

theme_klass = SexyForm::Themes::Bootstrap5Horizontal
theme = theme_klass.new

describe theme_klass do

  describe "theme_name" do
    it "is correct" do
      theme_klass.theme_name.should eq("bootstrap_5_horizontal")
    end
  end

  describe "SexyForm.form" do
    it "matches docs example" do
      expected = build_string do |str|
        str << %Q(<form method="post">)
          str << %Q(<div>)
            str << %Q(<div class="row">)
              str << %Q(<div class="col-sm-3">)
                str << %Q(<label for="email">Email</label>)
              str << %Q(</div>)
              str << %Q(<div class="col-sm-9">)
                str << %Q(<input type="text" class="form-control" name="email" id="email">)
              str << %Q(</div>)
            str << %Q(</div>)
          str << %Q(</div>)

          str << %Q(<div>)
            str << %Q(<div class="row">)
              str << %Q(<div class="col-sm-3">)
                str << %Q(<label for="password">Password</label>)
              str << %Q(</div>)
              str << %Q(<div class="col-sm-9">)
                str << %Q(<input type="password" class="form-control" name="password" id="password">)
              str << %Q(</div>)
            str << %Q(</div>)
          str << %Q(</div>)

          str << %Q(<div>)
            str << %Q(<div class="row">)
              str << %Q(<div class="col-sm-3"></div>)
              str << %Q(<div class="col-sm-9">)
                str << %Q(<div class="form-check">)
                  str << %Q(<input type="checkbox" class="form-check-input" name="remember_me" id="remember_me">)
                  str << %Q(<label class="form-check-label" for="remember_me">Remember Me</label>)
                str << %Q(</div>)
              str << %Q(</div>)
            str << %Q(</div>)
          str << %Q(</div>)
        str << %Q(</form>)
      end

      actual = SexyForm.form(theme: theme_klass.new(column_classes: ["col-sm-3", "col-sm-9"])) do |f|
        f << f.field(type: :text, name: :email)
        f << f.field(type: :password, name: :password)
        f << f.field(type: :checkbox, name: :remember_me)
      end

      actual.should eq(expected)
    end
  end

end
