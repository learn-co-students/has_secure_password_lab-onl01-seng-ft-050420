-> Name the password column datatype in migration => string 
-> Create sign up for at users#new 

<%= form_for @user, controller: 'users', action: 'create' do |f| %>
    <%= f.label :user %>
    <%= f.text_field :user %>
    <%= f.label :password %>
    <%= f.password_field :password %>
    <%= f.label :password_confirmation %>
    <%= f.password_field :password_confirmation%>
    <%= f.submit %>
<% end %>

<%= form_tag ({controller: 'sessions', action: "/create", method: 'post'}) do %>
    <%= label_tag "Username:" %>
    <%= text_field_tag :user %><br>
    <%= label_tag "Password:" %>
    <%= password_field_tag :password %><br>
    <%= label_tag "Confirm Password:"%>
    <%= password_field_tag :password_confirmation %><br>
    <%= submit_tag "Log In"%>
<% end %>