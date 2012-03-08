<table summary="Information about following/followers">
  <tr>
    <td class="main">
      <h1><%= @title %></h1>

      <% unless @users.empty? %>
        <ul class="users">
          <%= render @users %>
        </ul>
        <%= will_paginate @users %>
      <% end %>
    </td>
    <td class="sidebar round">
      <strong>Name</strong> <%= @user.name %><br />
      <strong>URL</strong> <%= link_to user_path(@user), @user %><br />
      <strong>Microposts</strong> <%= @user.microposts.count %>
      <%= render "shared/stats" %>
      <% unless @users.empty? %>
        <% @users.each du |user| %>
          <%= link_to gravatar_for(user, size: 30), user %>
        <% end %>
      <% end %>
    </td>
  </tr>
</table>