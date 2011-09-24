class IndexController < ApplicationController
def index

#tom=Sq.new()
#tom.looks="tomato"
#tom.save

# monster = Monster.find_by_name("Beholder")
# monster.update_attributes(:hitpoints => 100)

#tom=Sq.find_by_id(2777)
#tom.destroy
#tom.save

@sq = Sq.find(:all)
@params = params[:id]
end
end