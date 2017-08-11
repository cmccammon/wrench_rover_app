# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# wrench_rover_app

<% if quote.appointment1 %><%= radio_button_tag(:selected_appointment, quote.appointment1.strftime('%A, %d %b %Y %l:%M %P'), class: 'btn btn-primary') %><% end %>
<% if quote.appointment2 %><%= radio_button_tag(:selected_appointment, quote.appointment2.strftime('%A, %d %b %Y %l:%M %P'), class: 'btn btn-primary') %><% end %>
<% if quote.appointment3 %><%= radio_button_tag(:selected_appointment, quote.appointment3.strftime('%A, %d %b %Y %l:%M %P'), class: 'btn btn-primary') %><% end %
