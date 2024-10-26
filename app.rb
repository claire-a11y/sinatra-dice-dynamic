require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/:number_of_dice/:how_many_sides") do
  @num_dice = params.fetch("number_of_dice").to_i
  @sides = params.fetch("how_many_sides").to_i

  @rolls = []
  @num_dice.times do
    die = rand(1..@sides)
    @rolls.push(die)
  end

  erb(:flexible)
end

__END__

@@flexible
<h1><%= @num_dice %>d<%= @sides %></h1>

<ul>
  <% @rolls.each do |a_roll| %>
    <li><%= a_roll %></li>
  <% end %>
</ul>
